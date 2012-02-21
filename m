From: Jonathan Nieder <jrnieder@gmail.com>
Subject: [PATCH resend] acer-wmi: No wifi rfkill on Lenovo machines
Date: Tue, 21 Feb 2012 03:22:54 -0600
Message-ID: <20120221092254.GA26416@burratino>
References: <1327546404.15260.18.camel@linux-s257.site>
 <1328258799-19665-1-git-send-email-ike.pan@canonical.com>
 <20120211191044.GA7265@burratino>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:63209 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753790Ab2BUJXK (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 21 Feb 2012 04:23:10 -0500
Received: by iacb35 with SMTP id b35so8664361iac.19
        for <platform-driver-x86@vger.kernel.org>; Tue, 21 Feb 2012 01:23:09 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20120211191044.GA7265@burratino>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
Cc: Ike Panhc <ike.pan@canonical.com>, joeyli <jlee@suse.com>, Carlos Corbacho <carlos@strangeworlds.co.uk>, mjg@redhat.com, platform-driver-x86@vger.kernel.org, Dmitry Torokhov <dtor@mail.ru>, Corentin Chary <corentincj@iksaif.net>, Thomas Renninger <trenn@suse.de>, Seth Forshee <seth.forshee@canonical.com>, Andrey <andrey.k.p@gmail.com>, Andrew Morton <akpm@linux-foundation.org>

From: Ike Panhc <ike.pan@canonical.com>
Date: Fri, 3 Feb 2012 16:46:39 +0800

We have several reports which says acer-wmi is loaded on ideapads
and register rfkill for wifi which can not be unblocked.

Since ideapad-laptop also register rfkill for wifi and it works
reliably, it will be fine acer-wmi is not going to register rfkill
for wifi once VPC2004 is found.

Also put IBM0068/LEN0068 in the list. Though thinkpad_acpi has no
wifi rfkill capability, there are reports which says acer-wmi also
block wireless on Thinkpad E520/E420.

Signed-off-by: Ike Panhc <ike.pan@canonical.com>
Acked-by: Lee, Chun-Yi <jlee@suse.com>
Tested-by: Andrey <andrey.k.p@gmail.com> # Ideapad Z570
Signed-off-by: Jonathan Nieder <jrnieder@gmail.com>
Cc: stable@vger.kernel.org
---
Hi Matthew,

Here's a patch that seems to have fallen through the cracks.  Symptom
is that wifi just doesn't work on these machines until the acer-wmi
driver is unloaded.  Acked by the acer-wmi maintainer (jlee).  The
patch doesn't seem to be present in linux-next.  Bug was present in
3.1.8, possibly on some older kernels, too.

References:
  http://bugs.debian.org/655941
  https://bugzilla.redhat.com/show_bug.cgi?id=674353

Anything interested people can do to move this forward?
Jonathan

 drivers/platform/x86/acer-wmi.c |   30 +++++++++++++++++++++++++++++-
 1 files changed, 29 insertions(+), 1 deletions(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index b848277171a4..1e5290b5396d 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -679,6 +679,32 @@ static acpi_status AMW0_find_mailled(void)
 	return AE_OK;
 }
 
+static int AMW0_set_cap_acpi_check_device_found;
+
+static acpi_status AMW0_set_cap_acpi_check_device_cb(acpi_handle handle,
+	u32 level, void *context, void **retval)
+{
+	AMW0_set_cap_acpi_check_device_found = 1;
+	return AE_OK;
+}
+
+static const struct acpi_device_id norfkill_ids[] = {
+	{ "VPC2004", 0},
+	{ "IBM0068", 0},
+	{ "LEN0068", 0},
+	{ "", 0},
+};
+
+static int AMW0_set_cap_acpi_check_device(void)
+{
+	const struct acpi_device_id *id;
+
+	for (id = norfkill_ids; id->id[0]; id++)
+		acpi_get_devices(id->id, AMW0_set_cap_acpi_check_device_cb,
+				NULL, NULL);
+	return AMW0_set_cap_acpi_check_device_found;
+}
+
 static acpi_status AMW0_set_capabilities(void)
 {
 	struct wmab_args args;
@@ -692,7 +718,9 @@ static acpi_status AMW0_set_capabilities(void)
 	 * work.
 	 */
 	if (wmi_has_guid(AMW0_GUID2)) {
-		interface->capability |= ACER_CAP_WIRELESS;
+		if ((quirks != &quirk_unknown) ||
+		    !AMW0_set_cap_acpi_check_device())
+			interface->capability |= ACER_CAP_WIRELESS;
 		return AE_OK;
 	}
 
-- 
1.7.9
