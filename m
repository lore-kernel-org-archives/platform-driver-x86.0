From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v9 06/10] selftests: firmware: Add firmware_request_platform tests
Date: Thu,  5 Dec 2019 19:44:18 +0100
Message-ID: <20191205184422.7316-7-hdegoede@redhat.com>
References: <20191205184422.7316-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191205184422.7316-1-hdegoede@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Luis Chamberlain <mcgrof@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Peter Jones <pjones@redhat.com>, Dave Olsthoorn <dave@bewaar.me>, x86@kernel.org, platform-driver-x86@vger.kernel.org, linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-input@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Add tests cases for checking the new firmware_request_platform api.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../selftests/firmware/fw_filesystem.sh       | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/tools/testing/selftests/firmware/fw_filesystem.sh b/tools/test=
ing/selftests/firmware/fw_filesystem.sh
index 56894477c8bd..fcc281373b4d 100755
--- a/tools/testing/selftests/firmware/fw_filesystem.sh
+++ b/tools/testing/selftests/firmware/fw_filesystem.sh
@@ -86,6 +86,29 @@ else
 =09fi
 fi
=20
+# Try platform (EFI embedded fw) loading too
+if [ ! -e "$DIR"/trigger_request_platform ]; then
+=09echo "$0: firmware loading: platform trigger not present, ignoring test=
" >&2
+else
+=09if printf '\000' >"$DIR"/trigger_request_platform 2> /dev/null; then
+=09=09echo "$0: empty filename should not succeed (platform)" >&2
+=09=09exit 1
+=09fi
+
+=09# Note we echo a non-existing name, since files on the file-system
+=09# are preferred over firmware embedded inside the platform's firmware
+=09# The test adds a fake entry with the requested name to the platform's
+=09# fw list, so the name does not matter as long as it does not exist
+=09if ! echo -n "nope-$NAME" >"$DIR"/trigger_request_platform ; then
+=09=09echo "$0: could not trigger request platform" >&2
+=09=09exit 1
+=09fi
+
+=09# The test verifies itself that the loaded firmware contents matches
+=09# the contents for the fake platform fw entry it added.
+=09echo "$0: platform loading works"
+fi
+
 ### Batched requests tests
 test_config_present()
 {
--=20
2.23.0
