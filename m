Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0CDEAFA
	for <platform-driver-x86@vger.kernel.org>; Wed, 23 Apr 2025 05:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745387525; cv=none; b=RIM0Lan0jz4jHU8lYk0zlZ+RON5h45DF/yQgaOH8BnKRbfmCoi5Flf5h+wUdB86iqCdrXhzB6x9SwoXC+wlohNxmdMfqqbbiUjPcs3UA848vsAKCh7hNUmFvf66saRW3npeR9TmkB4h7zc295BiTWEjOpl2kEziOAUrm/5NXlCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745387525; c=relaxed/simple;
	bh=FlSZTOah8A0kEQCvBnCxhu3Lyot/sCGmehzm+dWLpkg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Jbj5onKDz6TcL4LNE/PE9x6ApoLMcHwEuflwuV3APGxHoRzTdaDKtf2BIGvnMM0NoLBwpATy2Y6cah3GDG3mtpojtBstlWpUpY6k72O7BWI0pEnnw5SRGbTMrVUitraDM3BErlRbF+0YRymwvepRjdF4CWqwWEN0Tp9neHk2AaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O2p4PVMK; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O2p4PVMK"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-227b828de00so64471955ad.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 22 Apr 2025 22:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745387523; x=1745992323; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QeEwzCFXVpKsuZ8MkyUbcpYkZfPd17iE8sR9VG4XWk0=;
        b=O2p4PVMKjih92LkVGhY0NGpXhrt+vQGatmEPve8nGmdOtOv6GCRKfTaxhOwtKcCh6d
         mus7prPWoL51LL0dsHXN0iXhQ38Zu0X0SAYzPVLSCP8KZoPwbYnX8uS24qLcVdTn6sil
         O5BxiWdC67b45hTh4tOGdLKBbC+6pXpJIGZ83zTfcpUeh4oQtdMOsJVbXazak0cfKSLG
         2INKL8mGnFhI97Zajb6TNUp4vEbtsQmrmuI2Ch5Kx+upw2BgrcKIA8P60vRO9hqQ7h+7
         n9w+nF1wfi+PITV4hXlOMdBOwx1yqGPEqr5FoEjnTD5z6bdk/2d4qayvVJ4IlsqUqV4X
         q7vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745387523; x=1745992323;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QeEwzCFXVpKsuZ8MkyUbcpYkZfPd17iE8sR9VG4XWk0=;
        b=L0PiWTrYY2pIyRJu4i7CWoi7m+WnvGVti71DaVuF9C2BHVboRq+N8CHs1DQj/YVUhm
         BU7RqWDIDAf/rH3tecmv2CSh5s/R55snp79xNxZsq5mxsTi8G03D6ejZe3PqKJ+8+/69
         zqZXXP1gGZ+YtWUIzBARiqOaUoXZaG2QLe3AZhLWYLS2McCkrie+g+yq1ZrbVmmZGoJH
         5CuZ8VOLGHQSFUgJK+xV4sy4Whfe1J2Iax2YpbifMjRArZuxFUaQOewMev1THqdVe3qH
         ybhmFRFLSKc1HIhfxhPWk2hvF0+hovFEy4slV3UOJ8PODNN999/bn9KtfxHvvo0gl7HC
         VhZg==
X-Gm-Message-State: AOJu0YyBOQHKyhoNlnr7Agb0EBu8QYVfWquvWNt8NItNbYxIJJtGAMrH
	pS3pwidDkPYnQMAVqnDb+ooeOoXDQ/ipmR7DUwK7nuU82UtysaP6
X-Gm-Gg: ASbGnctWO9RBvn1dNR9XLmsXm4DnWpHFwFpUqU3XTGoph2PYVuK+wq/WSYsLCo9H6bY
	d0hSG3MWKnzqwhkFNFx2WjUltCy3WpecaKQhwQV6yZSyDCES8mpA36ohekcRVNfPZbJyIMNxsap
	ovV/FsbH2VctGhCA/MAHXfqzKvI2EQDksMZBMgo4Zv/7GzWmfrPdQr2DPiUGFWombn1+3B8nMNB
	34hHCf13gnN31IBwWBPo9+quuk50Qj+/7rRwZiIqpVxit2A+L8ZZpGZWUEGsJkuG+jtb/y6ILq3
	271G7SLAcxMURdwN8JMoMSp2/CC+0WdVpBQK/ZpK5Cx6Pqn77NfSbXvBDu4VvVqoMX4emkSYbbO
	iegAxaFivPuSZbdRyiAdXW+XU74UUDK9dmbVKo5I=
X-Google-Smtp-Source: AGHT+IGAx6yI9I50VxDGn0uEjdvQJH5hayNo8XzKYPrsHC1em/njRqiyhvp8wN6Kifk9DhDyMSOeOA==
X-Received: by 2002:a17:902:f541:b0:223:325c:89f6 with SMTP id d9443c01a7336-22c53568612mr267758645ad.10.1745387523061;
        Tue, 22 Apr 2025 22:52:03 -0700 (PDT)
Received: from ubuntu-ThinkPad-X9-14-Gen-1.. (127.37.178.217.static.user.transix.jp. [217.178.37.127])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309dfa0abecsm689615a91.13.2025.04.22.22.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 22:52:02 -0700 (PDT)
From: Nitin Joshi <nitjoshi@gmail.com>
To: ilpo.jarvinen@linux.intel.com,
	hdegoede@redhat.com
Cc: platform-driver-x86@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	njoshi1@lenovo.com,
	Nitin Joshi <nitjoshi@gmail.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>
Subject: [PATCH v2] platform/x86: thinkpad-acpi: Add support for new hotkey for  camera shutter switch
Date: Wed, 23 Apr 2025 14:51:30 +0900
Message-ID: <20250423055130.9146-1-nitjoshi@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

New Lenovo Thinkpad models, e.g. the 'X9-14 Gen 1' and 'X9-15 Gen 1'
has new shortcut on F9 key i.e to switch camera shutter and it
send a new 0x131b hkey event when F9 key is pressed.

This commit adds support for new hkey 0x131b.

Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: Nitin Joshi <nitjoshi@gmail.com>
---
Changes in v2:

* Added ASL method to get camera shutter status and send it to userspace.
---
 drivers/platform/x86/thinkpad_acpi.c | 43 +++++++++++++++++++++++++++-
 1 file changed, 42 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 5790095c175e..80b02e8538e8 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -182,6 +182,7 @@ enum tpacpi_hkey_event_t {
 						   * directly in the sparse-keymap.
 						   */
 	TP_HKEY_EV_AMT_TOGGLE		= 0x131a, /* Toggle AMT on/off */
+	TP_HKEY_EV_CAMERASHUTTER_TOGGLE = 0x131b, /* Toggle Camera Shutter */
 	TP_HKEY_EV_DOUBLETAP_TOGGLE	= 0x131c, /* Toggle trackpoint doubletap on/off */
 	TP_HKEY_EV_PROFILE_TOGGLE	= 0x131f, /* Toggle platform profile in 2024 systems */
 	TP_HKEY_EV_PROFILE_TOGGLE2	= 0x1401, /* Toggle platform profile in 2025 + systems */
@@ -2250,6 +2251,25 @@ static void tpacpi_input_send_tabletsw(void)
 	}
 }
 
+static int get_camera_shutter(void)
+{
+	acpi_handle gces_handle;
+	int output;
+
+	if (ACPI_FAILURE(acpi_get_handle(hkey_handle, "GCES", &gces_handle))) {
+		/* Platform doesn't support GCES */
+		return -ENODEV;
+	}
+
+	if (!acpi_evalf(gces_handle, &output, NULL, "dd", 0))
+		return -EIO;
+
+	if (output & BIT(31))
+		return -ENODEV;
+
+	return output;
+}
+
 static bool tpacpi_input_send_key(const u32 hkey, bool *send_acpi_ev)
 {
 	bool known_ev;
@@ -3272,6 +3292,7 @@ static const struct key_entry keymap_lenovo[] __initconst = {
 	 * after switching to sparse keymap support. The mappings above use translated
 	 * scancodes to preserve uAPI compatibility, see tpacpi_input_send_key().
 	 */
+	{ KE_KEY, TP_HKEY_EV_CAMERASHUTTER_TOGGLE, { KEY_CAMERA_ACCESS_TOGGLE } },
 	{ KE_KEY, 0x131d, { KEY_VENDOR } }, /* System debug info, similar to old ThinkPad key */
 	{ KE_KEY, 0x1320, { KEY_LINK_PHONE } },
 	{ KE_KEY, TP_HKEY_EV_TRACK_DOUBLETAP /* 0x8036 */, { KEY_PROG4 } },
@@ -3303,7 +3324,7 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
 	const struct key_entry *keymap;
 	bool radiosw_state  = false;
 	bool tabletsw_state = false;
-	int hkeyv, res, status;
+	int hkeyv, res, status, camera_shutter_state;
 
 	vdbg_printk(TPACPI_DBG_INIT | TPACPI_DBG_HKEY,
 			"initializing hotkey subdriver\n");
@@ -3467,6 +3488,13 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
 	if (res)
 		return res;
 
+	camera_shutter_state = get_camera_shutter();
+	if (camera_shutter_state >= 0) {
+		input_set_capability(tpacpi_inputdev, EV_SW, SW_CAMERA_LENS_COVER);
+		input_report_switch(tpacpi_inputdev,
+				SW_CAMERA_LENS_COVER, camera_shutter_state);
+	}
+
 	if (tp_features.hotkey_wlsw) {
 		input_set_capability(tpacpi_inputdev, EV_SW, SW_RFKILL_ALL);
 		input_report_switch(tpacpi_inputdev,
@@ -3633,6 +3661,8 @@ static void adaptive_keyboard_s_quickview_row(void)
 /* 0x1000-0x1FFF: key presses */
 static bool hotkey_notify_hotkey(const u32 hkey, bool *send_acpi_ev)
 {
+	int camera_shutter_state;
+
 	/* Never send ACPI netlink events for original hotkeys (hkey: 0x1001 - 0x1020) */
 	if (hkey >= TP_HKEY_EV_ORIG_KEY_START && hkey <= TP_HKEY_EV_ORIG_KEY_END) {
 		*send_acpi_ev = false;
@@ -3643,6 +3673,17 @@ static bool hotkey_notify_hotkey(const u32 hkey, bool *send_acpi_ev)
 			return true;
 	}
 
+	camera_shutter_state = get_camera_shutter();
+	if (hkey == TP_HKEY_EV_CAMERASHUTTER_TOGGLE && (camera_shutter_state >= 0)) {
+		mutex_lock(&tpacpi_inputdev_send_mutex);
+
+		input_report_switch(tpacpi_inputdev,
+			SW_CAMERA_LENS_COVER, camera_shutter_state);
+		input_sync(tpacpi_inputdev);
+
+		mutex_unlock(&tpacpi_inputdev_send_mutex);
+	}
+
 	return tpacpi_input_send_key(hkey, send_acpi_ev);
 }
 
-- 
2.43.0

