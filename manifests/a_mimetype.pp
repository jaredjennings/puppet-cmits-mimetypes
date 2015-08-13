# % CMITS - Configuration Management for Information Technology Systems
# % Based on <https://github.com/afseo/cmits>.
# % Copyright 2015 Jared Jennings <mailto:jjennings@fastmail.fm>.
# %
# % Licensed under the Apache License, Version 2.0 (the "License");
# % you may not use this file except in compliance with the License.
# % You may obtain a copy of the License at
# %
# %    http://www.apache.org/licenses/LICENSE-2.0
# %
# % Unless required by applicable law or agreed to in writing, software
# % distributed under the License is distributed on an "AS IS" BASIS,
# % WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# % See the License for the specific language governing permissions and
# % limitations under the License.

# This define will help us insert MIME types below. It is only useful in the
# case where there is a single file extension given for the MIME type.
define mimetypes::a_mimetype($ext) {
    # mimetype_$name may be more correct but too long to be wieldy.
    augeas { "mimetype_for_$ext":
	# incl + lens instead of context "greatly speeds up execution"
	incl => "/etc/mime.types",
	lens => "Mimetypes.lns",
	changes => [
	    "set rules[.='$name'] '$name'",
	    "set rules[.='$name']/rule '$ext'",
	],
    }
}
