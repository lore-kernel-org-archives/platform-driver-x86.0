Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60606C4332D
	for <platform-driver-x86@archiver.kernel.org>; Wed, 10 Feb 2021 23:46:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3479164E42
	for <platform-driver-x86@archiver.kernel.org>; Wed, 10 Feb 2021 23:46:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231815AbhBJXqq (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 10 Feb 2021 18:46:46 -0500
Received: from ganymed.uberspace.de ([185.26.156.242]:60766 "EHLO
        ganymed.uberspace.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233874AbhBJXqp (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 10 Feb 2021 18:46:45 -0500
Received: (qmail 32216 invoked from network); 10 Feb 2021 23:45:57 -0000
Received: from localhost (HELO localhost) (127.0.0.1)
  by ganymed.uberspace.de with SMTP; 10 Feb 2021 23:45:57 -0000
From:   Alexander Kobel <a-kobel@a-kobel.de>
Subject: [PATCH v3] platform/x86: thinkpad_acpi: Handle keyboard cover
 attach/detach events
To:     Hans de Goede <hdegoede@redhat.com>,
        Nitin Joshi1 <njoshi1@lenovo.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        Mark Pearson <mpearson@lenovo.com>,
        =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>
Message-ID: <d2b4f0df-0d09-e4c0-26d6-ef4c29e5415a@a-kobel.de>
Date:   Thu, 11 Feb 2021 00:45:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256; boundary="------------ms020404020302020902020303"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

This is a cryptographically signed message in MIME format.

--------------ms020404020302020902020303
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

ThinkPad X1 Tablets emit HKEY 0x4012 and 0x4013 events when a keyboard
cover is attached/detached or folded to the back of the device. They are
used to switch from normal to tablet mode in userspace; e.g., to offer
touch keyboard choices when focus goes to a text box and no keyboard is
attached, or to enable autorotation of the display according to the
built-in orientation sensor.

This patch handles the two events by issuing corresponding
SW_TABLET_MODE notifications to the ACPI userspace.

Tested as working on a ThinkPad X1 Tablet Gen 2, 20JCS00C00, and as
non-interfering with a ThinkPad X1 Carbon 7th, 20QESABM02 (normal
clamshell, so it does not have a keyboard cover).

Signed-off-by: Alexander Kobel <a-kobel@a-kobel.de>
---
 drivers/platform/x86/thinkpad_acpi.c | 100 ++++++++++++++++++++++++++-
 1 file changed, 99 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/=
thinkpad_acpi.c
index c404706379d9..c3e805f478a3 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -145,6 +145,45 @@ enum {
 	TP_ACPI_WGSV_STATE_UWBPWR	=3D 0x0020, /* UWB radio enabled */
 };
=20
+/* ThinkPad GTOP ("Get Tablet OPtion") methods */
+enum {
+	TP_GTOP_CMD_QUERY_VERSION		=3D 0x0000,
+	TP_GTOP_CMD_QUERY_INTERFACE_TYPE	=3D 0x0100,
+	TP_GTOP_CMD_GET_ATTACH_OPTION		=3D 0x2000,
+};
+
+#define TP_GTOP_MINIMUM_VERSION	0x0103
+
+enum {
+	TP_GTOP_INTERFACE_TYPE_RESERVED		=3D 0,
+	TP_GTOP_INTERFACE_TYPE_ANY_TYPE		=3D 1,
+	TP_GTOP_INTERFACE_TYPE_TP_HELIX		=3D 2,
+	TP_GTOP_INTERFACE_TYPE_TP10		=3D 3,
+	TP_GTOP_INTERFACE_TYPE_TP_X1_TAB	=3D 4,
+};
+
+/* Attach option states for GTOP Type 1 interfaces ("Any type") */
+#define TP_GTOP_ANY_TYPE_STATE_ANY_OPTION_ATTACHED	BIT(0)
+
+/*
+ * Attach option states for GTOP Type 4 interfaces ("ThinkPad X1 Tablet =
series")
+ * 0: detached, 1: attached
+ * except for special meanings for Pico cartridge and folio keyboard cov=
er location
+ */
+#define TP_GTOP_TP_X1_TAB_STATE_THIN_KBD_ATTACHED		BIT(0)
+#define TP_GTOP_TP_X1_TAB_STATE_PRO_CARTRIDGE_ATTACHED		BIT(1)
+#define TP_GTOP_TP_X1_TAB_STATE_PICO_CARTRIDGE_ATTACH_MASK	GENMASK(3, 2)=

+#define TP_GTOP_TP_X1_TAB_STATE_3D_CARTRIDGE_ATTACHED		BIT(4)
+#define TP_GTOP_TP_X1_TAB_STATE_RESERVE1_ATTACHED		BIT(5)
+#define TP_GTOP_TP_X1_TAB_STATE_RESERVE2_ATTACHED		BIT(6)
+#define TP_GTOP_TP_X1_TAB_STATE_FOLIO_KBD_FOLDED_ONTO_BACK	BIT(16)
+
+/* Special values for Pico cartridge state (bits 3-2) */
+#define TP_GTOP_TP_X1_TAB_STATE_PICO_CARTRIDGE_DETACHED		0
+#define TP_GTOP_TP_X1_TAB_STATE_PICO_CARTRIDGE_ATTACHED		BIT(2)
+#define TP_GTOP_TP_X1_TAB_STATE_PICO_CARTRIDGE_BATTERY_ERROR	BIT(3)
+#define TP_GTOP_TP_X1_TAB_STATE_PICO_CARTRIDGE_RESERVED		(BIT(2) | BIT(3=
))
+
 /* HKEY events */
 enum tpacpi_hkey_event_t {
 	/* Hotkey-related */
@@ -174,6 +213,12 @@ enum tpacpi_hkey_event_t {
 						     or port replicator */
 	TP_HKEY_EV_HOTPLUG_UNDOCK	=3D 0x4011, /* undocked from hotplug
 						     dock or port replicator */
+	/*
+	 * Thinkpad X1 Tablet series devices emit 0x4012 and 0x4013
+	 * when keyboard cover is attached, detached or folded onto the back
+	 */
+	TP_HKEY_EV_KBD_COVER_ATTACH	=3D 0x4012, /* keyboard cover attached */
+	TP_HKEY_EV_KBD_COVER_DETACH	=3D 0x4013, /* keyboard cover detached or f=
olded back */
=20
 	/* User-interface events */
 	TP_HKEY_EV_LID_CLOSE		=3D 0x5001, /* laptop lid closed */
@@ -308,6 +353,10 @@ static struct {
 		TP_HOTKEY_TABLET_NONE =3D 0,
 		TP_HOTKEY_TABLET_USES_MHKG,
 		TP_HOTKEY_TABLET_USES_GMMS,
+		TP_HOTKEY_TABLET_USES_GTOP_ANY_TYPE,
+		TP_HOTKEY_TABLET_USES_GTOP_TP_HELIX,
+		TP_HOTKEY_TABLET_USES_GTOP_TP10,
+		TP_HOTKEY_TABLET_USES_GTOP_TP_X1_TAB,
 	} hotkey_tablet;
 	u32 kbdlight:1;
 	u32 light:1;
@@ -2166,11 +2215,32 @@ static int hotkey_gmms_get_tablet_mode(int s, int=
 *has_tablet_mode)
 	return !!(mode & TP_ACPI_MULTI_MODE_TABLET_LIKE);
 }
=20
+static bool hotkey_gtop_any_type_get_tablet_mode(int s)
+{
+	return !(s & TP_GTOP_ANY_TYPE_STATE_ANY_OPTION_ATTACHED);
+}
+
+static bool hotkey_gtop_tp_x1_tab_get_tablet_mode(int s)
+{
+	return (!(s & TP_GTOP_TP_X1_TAB_STATE_THIN_KBD_ATTACHED) ||
+		(s & TP_GTOP_TP_X1_TAB_STATE_FOLIO_KBD_FOLDED_ONTO_BACK));
+}
+
 static int hotkey_get_tablet_mode(int *status)
 {
 	int s;
=20
 	switch (tp_features.hotkey_tablet) {
+	case TP_HOTKEY_TABLET_USES_GTOP_ANY_TYPE:
+		if (!acpi_evalf(hkey_handle, &s, "GTOP", "dd", TP_GTOP_CMD_GET_ATTACH_=
OPTION))
+			return -EIO;
+		*status =3D hotkey_gtop_any_type_get_tablet_mode(s);
+		break;
+	case TP_HOTKEY_TABLET_USES_GTOP_TP_X1_TAB:
+		if (!acpi_evalf(hkey_handle, &s, "GTOP", "dd", TP_GTOP_CMD_GET_ATTACH_=
OPTION))
+			return -EIO;
+		*status =3D hotkey_gtop_tp_x1_tab_get_tablet_mode(s);
+		break;
 	case TP_HOTKEY_TABLET_USES_MHKG:
 		if (!acpi_evalf(hkey_handle, &s, "MHKG", "d"))
 			return -EIO;
@@ -3213,7 +3283,29 @@ static int hotkey_init_tablet_mode(void)
 	int in_tablet_mode =3D 0, res;
 	char *type =3D NULL;
=20
-	if (acpi_evalf(hkey_handle, &res, "GMMS", "qdd", 0)) {
+	if (acpi_evalf(hkey_handle, &res, "GTOP", "qdd", TP_GTOP_CMD_QUERY_VERS=
ION) &&
+	    res >=3D TP_GTOP_MINIMUM_VERSION &&
+	    acpi_evalf(hkey_handle, &res, "GTOP", "qdd", TP_GTOP_CMD_QUERY_INTE=
RFACE_TYPE)) {
+		switch (res) {
+		case TP_GTOP_INTERFACE_TYPE_ANY_TYPE:
+			tp_features.hotkey_tablet =3D TP_HOTKEY_TABLET_USES_GTOP_ANY_TYPE;
+			if (acpi_evalf(hkey_handle, &res, "GTOP", "qdd",
+				       TP_GTOP_CMD_GET_ATTACH_OPTION))
+				in_tablet_mode =3D hotkey_gtop_any_type_get_tablet_mode(res);
+			type =3D "GTOP";
+			break;
+		case TP_GTOP_INTERFACE_TYPE_TP_X1_TAB:
+			tp_features.hotkey_tablet =3D TP_HOTKEY_TABLET_USES_GTOP_TP_X1_TAB;
+			if (acpi_evalf(hkey_handle, &res, "GTOP", "qdd",
+				       TP_GTOP_CMD_GET_ATTACH_OPTION))
+				in_tablet_mode =3D hotkey_gtop_tp_x1_tab_get_tablet_mode(res);
+			type =3D "GTOP";
+			break;
+		default:
+			pr_err("unsupported GTOP type, please report this to %s\n", TPACPI_MA=
IL);
+			break;
+		}
+	} else if (acpi_evalf(hkey_handle, &res, "GMMS", "qdd", 0)) {
 		int has_tablet_mode;
=20
 		in_tablet_mode =3D hotkey_gmms_get_tablet_mode(res,
@@ -3989,6 +4081,12 @@ static bool hotkey_notify_dockevent(const u32 hkey=
,
 	case TP_HKEY_EV_HOTPLUG_UNDOCK: /* undocked from port replicator */
 		pr_info("undocked from hotplug port replicator\n");
 		return true;
+	case TP_HKEY_EV_KBD_COVER_ATTACH:
+	case TP_HKEY_EV_KBD_COVER_DETACH:
+		tpacpi_input_send_tabletsw();
+		hotkey_tablet_mode_notify_change();
+		*send_acpi_ev =3D false;
+		return true;
=20
 	default:
 		return false;
--=20
2.30.1


--------------ms020404020302020902020303
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCC
Ew0wggY9MIIEJaADAgECAgg3B676YzbKKTANBgkqhkiG9w0BAQsFADBSMQswCQYDVQQGEwJE
RTEXMBUGA1UECgwORnJhdW5ob2ZlciBTSVQxKjAoBgNVBAMMIVZvbGtzdmVyc2NobHVlc3Nl
bHVuZyBSb290IENBIEcwMjAeFw0yMDA1MjYxMzIxNDFaFw0zMDA1MjUxMzIxNDFaMFUxCzAJ
BgNVBAYTAkRFMRcwFQYDVQQKDA5GcmF1bmhvZmVyIFNJVDEtMCsGA1UEAwwkVm9sa3N2ZXJz
Y2hsdWVzc2VsdW5nIFByaXZhdGUgQ0EgRzAyMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIIC
CgKCAgEAzW9OcLabPtfz9rbgtyyuNQCQkmI8cPW39VGsXLX1J9EIcUPvp1ysi6kuqMfw+YOC
LjxopSIhpjhH/p84LzmcBJElRPkzWHJreZry+Lu5SDhOcOH49fNEo7UeYE0wkSJNv+jLMWwU
H93dPaSNeRN/5/Peq6tcKTx0FflS2ZScP9OcPvXgp1c/bXYoRyiOGSVR8/+7qlwNuku2px6f
0c6XOKOwkyTeSghmQ8vdfeqcMd9fNUhn/ijWFHahr0LUGB9We6SoxklOz9gfgSCjhInt+4qy
N6bHl/utH/vj1qnuhkaP25h1eCbz2WKqv0wKWwa/r4F0ItLYYP2YhwICTNLDDT8GmctRdt2S
yLmgXo9Gz0nrwrYuGMWcXNLm682Fgg3wQne0DTszFFUU8PrVOtgzB5Qm6DPrRSUHXQEfT7DY
ZzDA+FmSoTSiCe+aoNPbglta4gDar0B/gni15LtCzW4tNhk3fXkYxEWpbq32vNy3wCDOQazc
vxzko5Ior1iDZJNuzurtp5qRjAnOcUiKhNUJeBnmLDB/Di9XZHIQCD0EjiZzef0OR4+ZbPPM
xl6n9KHdrZ2c8r3yjGJtGkeMc0aMkBpvYNDy/s4fYnE5MRIOWdmMnq23/DvCpsQtF5UWZlF9
MaKVcjXmtGpnhpe0XOkFXvxd9PSM0Oe4uei+buhbF7ECAwEAAaOCARIwggEOMBIGA1UdEwEB
/wQIMAYBAf8CAQAwHwYDVR0jBBgwFoAUPnwBB805qJCxODW0j7v1rBeEocAwTQYIKwYBBQUH
AQEEQTA/MD0GCCsGAQUFBzAChjFodHRwOi8vdm9sa3N2ZXJzY2hsdWVzc2VsdW5nLmRlL2Nh
L3Jvb3RjYV9nMDIuY3J0MBQGA1UdIAQNMAswCQYHKyQPCQMBATBDBgNVHR8EPDA6MDigNqA0
hjJodHRwOi8vdm9sa3N2ZXJzY2hsdWVzc2VsdW5nLmRlL2NybC9yb290Y2FfZzAyLmNybDAd
BgNVHQ4EFgQUBNGCAAc5XwIAgrw4HtCXwN3HOwMwDgYDVR0PAQH/BAQDAgEGMA0GCSqGSIb3
DQEBCwUAA4ICAQAPsI1fETAPUfq7LoI2FxRDylRduC/nVhVca7ORxhZXrFmksT/q1jHU4eXK
IhcVms623/FHhcVHl1qB5G/cgU2OtjEP5/BXIRu4I78EZIhb8U3ZGe9gZql/RSOBD08lhmzv
fRz+nwE2Pl9stzXKohjGRWyfFfuaWKLXUZzCK/wYX6IqhTxjkoEFSgejoO41B886rrm3+aaO
5Db5EBW4gYWF9VCV3bmedmTJzbvOOYDxaVT1+O8E9Ym5BZL+qJNjgdjJXE1TUGyUg6ZweNHT
dse6xTc9KhfnAyppkMUu9AKT6jkloA6l0/T3zEMKhvtf9gLYWJ0zMwm1JfQk5mVMZtQoOPYI
Wj7IVUKPZJMizHoaAAIzi7C0w3XpN3xMDJOs5eRsRPk0qF8UulshIUA/6idOrg7eUY4WZGN1
RZsFYyhBg1sPaeFyFAUs0XJUrWLOKO5f9VZGbmEF6gqbTxdwMCJZzonwpUxVwxKLMa+Z4EMG
QoY1rLNPCRZlzhW+TRBsuy4tGN21PlhvcvEnxs8eHvqlwfM/KwYtXhLG8881KMMSzemRvX/c
pNCU2YlHpAwpdm6cAn60leS0WPfTb6QAqmtQTij6uAfFN46hQDLqpfTWnoPSMvbeyFwqP6Fv
V6RgquAIpe9p5daLY9M+Krkd7mH8QR2PN615TboR0ocoF4REdTCCBlwwggREoAMCAQICCBUM
N0NLozG+MA0GCSqGSIb3DQEBCwUAMFUxCzAJBgNVBAYTAkRFMRcwFQYDVQQKDA5GcmF1bmhv
ZmVyIFNJVDEtMCsGA1UEAwwkVm9sa3N2ZXJzY2hsdWVzc2VsdW5nIFByaXZhdGUgQ0EgRzAy
MB4XDTIwMTAxMTE2NTIzN1oXDTIzMTAxMDE2NTIzN1owgYkxGDAWBgNVBAMMD0FMRVhBTkRF
UiBLT0JFTDEOMAwGA1UEBAwFS09CRUwxEjAQBgNVBCoMCUFMRVhBTkRFUjFJMEcGA1UEBRNA
RDQwMDNFMTc4OTlGMTQzMTI2ODExMzM0OUY1N0M1QzU0NEQ5RjcwNDVCQTkyMEJEMzdDQURB
NTQzOEFGQ0EzODCCAaIwDQYJKoZIhvcNAQEBBQADggGPADCCAYoCggGBAM9yNVKr/cuT0WnJ
PLe7kmfd5Wo7rlb1F+harCy3OLgaTqkMI6j37OTXMAmdkZ0y7zrlhbEGCEpODaDPYwVSEb+s
Cv05n3SAMCdy9kQlnqP9We7C/2mbnuKYhpO5P6mUVdPoM+tfTM22YH7CzO8sa1Tq1s/DrIZs
NhXDRvWZEdDwUCjLPKVXGtTqHbUjs7OufxpbyzA7xHE5N7qRff1WrOuq/RS1OvGZVcUjLAmI
loYCvYm1Q3oBYuSZygOsawjmJQ14fh7dKkOjogx6byElWAVBkUQxud8CtBHW+L4VY35uinRJ
k81mwI8ac0zS5FEbYWoF9Gi5pWbCgoIvGXIMcPEQqu8mVBpN/CAMUOUlIkOPDvFqfiQ9TI2C
xnNih8csWwVInRS7m8itJrnlbVfDwdHMJhPT522gCDOC6lXaRUizwGqRh/26W1dJqA2SYmEn
EMH/TcP3eyiFLN5QDXm2odnh+rbvQbwEtlPxup24HGe8RqWFdiCOW1syM+V74lUn5wIDAQAB
o4IBeTCCAXUwHQYDVR0RBBYwFIESYS1rb2JlbEBhLWtvYmVsLmRlMA4GA1UdDwEB/wQEAwIG
wDATBgNVHSUEDDAKBggrBgEFBQcDBDAMBgNVHRMBAf8EAjAAMB8GA1UdIwQYMBaAFATRggAH
OV8CAIK8OB7Ql8DdxzsDMIGCBggrBgEFBQcBAQR2MHQwQAYIKwYBBQUHMAKGNGh0dHA6Ly92
b2xrc3ZlcnNjaGx1ZXNzZWx1bmcuZGUvY2EvcHJpdmF0ZWNhX2cwMi5jcnQwMAYIKwYBBQUH
MAGGJGh0dHA6Ly9vY3NwLnZvbGtzdmVyc2NobHVlc3NlbHVuZy5kZTAUBgNVHSAEDTALMAkG
ByskDwkDAQEwRgYDVR0fBD8wPTA7oDmgN4Y1aHR0cDovL3ZvbGtzdmVyc2NobHVlc3NlbHVu
Zy5kZS9jcmwvcHJpdmF0ZWNhX2cwMi5jcmwwHQYDVR0OBBYEFDadSlBdeaipQdbmS4vn439F
6fkNMA0GCSqGSIb3DQEBCwUAA4ICAQBUhcmTTecspwaSgUUlrG/gUPzDLM/Ty0Jpz4GvRbRn
kJxHlHAopkk8P1SXlnOy2kfC5LgFCRB9tJqSlXmIXwphm90fZKRGZU2dBgxGkDQppXGH6PjJ
P52QAhvpztJDPEqfqkzcpKdkYuFg+KEzqZmsu8Mvy4rqCTRIAtOX5zHVFEIarp7YUMNhzGxg
eQakmDjykC1Xksx/ULsX7r5QW5Fqp1ZL5obNmA2emJgn0VrKRIYY8vqnOwUi13G/lDa+fphz
PMhpIKOKQ9Wy0Wn8mBdSdIqmt2L58Pu14ygwOkK3vnb/QKqayhwme2uf4waXG5or3wZdSr39
SvvGZT8Z6cHw6n7Jw0+gRApkB1cUO7j1T/aHCBcZPJ5i6bBoGrT5E8IHIqj+oZXUCY7jxknL
aHaiOARg8fFkf8lp3uy7ay4WcDIorPa9ugNaCP3SnYvtKvk44ulgMIjhvkG1Mga/70SA9Evq
3cFUle3jaaEYujSxLnN8LVm39dR93QCqcdkIayPA9LT6vizlGoA6BdOMWDzKWWnoelYTb+Ip
iqpafot50MCUqf1e2T0z8Ygki1LLOxlpi/DWQApb/Qq9EomeEYMKm0aJc7166pLiWsk1fWOX
kwBa3phG+CbbUxqotGP++r39Dk8Diny+lYjkRXpoqggzF9g9uxARXBIw0H+G6XbgCzCCBmgw
ggRQoAMCAQICCGRFBiAAmYjgMA0GCSqGSIb3DQEBCwUAMFUxCzAJBgNVBAYTAkRFMRcwFQYD
VQQKDA5GcmF1bmhvZmVyIFNJVDEtMCsGA1UEAwwkVm9sa3N2ZXJzY2hsdWVzc2VsdW5nIFBy
aXZhdGUgQ0EgRzAyMB4XDTIwMTAxMTE2NTIyM1oXDTIzMTAxMDE2NTIyM1owgYkxGDAWBgNV
BAMMD0FMRVhBTkRFUiBLT0JFTDEOMAwGA1UEBAwFS09CRUwxEjAQBgNVBCoMCUFMRVhBTkRF
UjFJMEcGA1UEBRNARDQwMDNFMTc4OTlGMTQzMTI2ODExMzM0OUY1N0M1QzU0NEQ5RjcwNDVC
QTkyMEJEMzdDQURBNTQzOEFGQ0EzODCCAaIwDQYJKoZIhvcNAQEBBQADggGPADCCAYoCggGB
AIHe4er7YlQrv+fgKBYbb2FSJLtzoB9s4ZhYgIfQuR1x9+WJvj9EMne5rsHB+OJ5bwZQ1Fnh
qhJhtepikZhLDRVfRbzRdrOSzxnkePhH/SZ9VhtN6327PuSAwxe/te/DPDo6aWZj3d7RoioE
UgkyF5gNWYu082LeSHbvNpDcHUN2Rs7XgZi5uBUnHR1btXA7BOzUMfPhEIqwuCDKLZAGCc0q
2JKhKeOIOsoZ8lP2/HfW3Az1ij6xztb/HfoZnyZMpQC1ly7VgJU5rTLRJz39kscZSBcnxRqP
8cE9rrlPZOgRPK2NR4x+30Sr9sOtnbRYldKWT4uCtqrPrnxNKiDkv3P2h1yKYbCamlqwaoJW
cjrphzLycSGHitalla/f82xHSN+7gJHGp91WYIn+c6jPLcx0wmKUJBB1TIEaeh4izkqLwB0P
1HUBHo50OdmTnRGdnvNt/+Xsc9KetVnmJM2bqXXDlgYMfsULoe6Y0AVemQFvd1V49GePGpGT
NGMe5jf7NwIDAQABo4IBhTCCAYEwHQYDVR0RBBYwFIESYS1rb2JlbEBhLWtvYmVsLmRlMA4G
A1UdDwEB/wQEAwIEMDAfBgNVHSUEGDAWBgorBgEEAYI3CgMEBggrBgEFBQcDBDAMBgNVHRMB
Af8EAjAAMB8GA1UdIwQYMBaAFATRggAHOV8CAIK8OB7Ql8DdxzsDMIGCBggrBgEFBQcBAQR2
MHQwQAYIKwYBBQUHMAKGNGh0dHA6Ly92b2xrc3ZlcnNjaGx1ZXNzZWx1bmcuZGUvY2EvcHJp
dmF0ZWNhX2cwMi5jcnQwMAYIKwYBBQUHMAGGJGh0dHA6Ly9vY3NwLnZvbGtzdmVyc2NobHVl
c3NlbHVuZy5kZTAUBgNVHSAEDTALMAkGByskDwkDAQEwRgYDVR0fBD8wPTA7oDmgN4Y1aHR0
cDovL3ZvbGtzdmVyc2NobHVlc3NlbHVuZy5kZS9jcmwvcHJpdmF0ZWNhX2cwMi5jcmwwHQYD
VR0OBBYEFJiKTcJJSCtBVQS6oS4OSO8QKEWBMA0GCSqGSIb3DQEBCwUAA4ICAQBfdnVpzlnO
JupsJfdYW9xyt3lSky85oA1qPichmW6UjrnIZdunQPJrCTTM+7wUqeqwlhbRmwUKgAPH/5fc
cOnyMulgbvc50VV+mBK4ph/1/fhom7zJYEfvKEpPWg5tGx3/Mp6YIVvuhRnZ7vmodMGXgj/f
1D7yHFJib/430e6pcD76DPaAFA1cVVp5FUP+b0fBzvgYjsgSwL2GTXXaNGEaLqBuhtmInBh/
y4X2ZEz8kw6B2P0GpQ8jg+5I1tNM6vf/KH2FxDj/ykmSsgtyrQAddEjrNQbaQAzXTtHAPui/
6/wbgYfLp05aH7PsLsKGdDS9yb8UaWfWgwFuFz3dLXSdI3YYhXB2QnASX5RV3ndnu9vwGmns
c6iu4C9+h0hFdcWMIEso5K/mV/kXO31xzw7JLU2y5Nk7XEgrXwqFuX4ZruqCfw3EXP1hYnmt
OtfAaSLzTdBS0GskGGnWAs12dJrL8FysZbtX5cgWMyT1nun8ksvSodVgQ+7BA5YHTwfHussP
nPBDabaHmlOUVBi3IYZvoJ90XwuuMvVqcYeEzvuGDrssZHY2pG9DqTeXfzmUdpTfMy7zwu5K
jBPKilDLTXJkrA5wlQpSihjSQG/UPLP+YDsrEuwwBC1DbcSn5KOyMXFpfxsoSegFzb0lxPRc
6sScLr/v96FwvwWpL54Fp9dr0TGCA80wggPJAgEBMGEwVTELMAkGA1UEBhMCREUxFzAVBgNV
BAoMDkZyYXVuaG9mZXIgU0lUMS0wKwYDVQQDDCRWb2xrc3ZlcnNjaGx1ZXNzZWx1bmcgUHJp
dmF0ZSBDQSBHMDICCBUMN0NLozG+MA0GCWCGSAFlAwQCAQUAoIIBvTAYBgkqhkiG9w0BCQMx
CwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0yMTAyMTAyMzQ1NTVaMC8GCSqGSIb3DQEJ
BDEiBCAKsOz9N2xZh7cYYJsFupDO1bxAVluxMnCwnd+HXkYTOjBsBgkqhkiG9w0BCQ8xXzBd
MAsGCWCGSAFlAwQBKjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwDgYIKoZIhvcNAwICAgCA
MA0GCCqGSIb3DQMCAgFAMAcGBSsOAwIHMA0GCCqGSIb3DQMCAgEoMHAGCSsGAQQBgjcQBDFj
MGEwVTELMAkGA1UEBhMCREUxFzAVBgNVBAoMDkZyYXVuaG9mZXIgU0lUMS0wKwYDVQQDDCRW
b2xrc3ZlcnNjaGx1ZXNzZWx1bmcgUHJpdmF0ZSBDQSBHMDICCGRFBiAAmYjgMHIGCyqGSIb3
DQEJEAILMWOgYTBVMQswCQYDVQQGEwJERTEXMBUGA1UECgwORnJhdW5ob2ZlciBTSVQxLTAr
BgNVBAMMJFZvbGtzdmVyc2NobHVlc3NlbHVuZyBQcml2YXRlIENBIEcwMgIIZEUGIACZiOAw
DQYJKoZIhvcNAQEBBQAEggGAsoOZR6JgqgCZk1sks4oOiUhDA9sjeZ53sUNKhc5uCWau9xlp
7mo6WCWp2IRGemz9LYYLOcvm7VooodI4klHFaNfl8kEF6fRzrQ7yPC2Et7gyhKpZXlrOH3AO
AGg//ssByLBBwukJY8+oLwBRz6p2gI+ad7T1bBF8F3bbAms65fIYVQClE435hSV4QbfDE83K
sg/33VjTRdgHtXjs7NFPCcCyD6u2Ztxila9y/Ee3bNv9vwdAbIwM3OuuOMCW0cMRv6pm73yS
rEiw+ZmxpgsWrkF/dwvcQKFeEcWAqsAiy62co4NA8JG7k7x3qnBI29d+widBFRBxAGr/al9l
N9K7G/L59vc54p/8BgpQgHwzf6UYf8Ou/rUm/aaQ1oPoGSBkYvsJ/+sztJ5EgNGqddUH0Qdf
cL1VWwGVelY0gudHr2ai+SvZDKZmo3YaBvN1PcFOFJXseAr5L0lpEx5dmmehqamttV2vE+EM
/fNi5Qw45ztu81vYSwZncgwtziWYiFi2AAAAAAAA
--------------ms020404020302020902020303--
