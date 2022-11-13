Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A226C4332F
	for <platform-driver-x86@archiver.kernel.org>; Sun, 13 Nov 2022 12:13:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235242AbiKMMNV (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 13 Nov 2022 07:13:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233792AbiKMMNU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 13 Nov 2022 07:13:20 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02D4D11444
        for <platform-driver-x86@vger.kernel.org>; Sun, 13 Nov 2022 04:13:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net; s=s31663417;
        t=1668341591; bh=b0ELlfN/u7KSHLTcCyzjscFJkygA0yhOJIROrtbG38s=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=oojhjaeP3k4oJi75/ed45BhX4tj6MxQ4RLcFnXoD+EZv0sO4sooDs/U0MsmR3kMtS
         ayP6B8g8Dnjr4yMDC/mG5fiHC+l53qwjxNhyZi7ZSZHPhzfQU7hlGXyjqwo0JaAudH
         R/rnHywwTQWwpBTROinc3PxMwIZy2xQatFVbM+PmgQaqJ0k1VoFErE8UTgf4GWaxrx
         aRnXbjWPu65jElnVZlg1yoUqXOprmg70udalE55EPgmLqBmM96wn5X3ZRLJOXxUx5f
         DzcVFoVcKb4IjqvxRVDCss80PP/Ffmqw+ID38fnFc5vBKKOMpdvu4Hs7yO0hSqp/r8
         XLK/hRRzodt3w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from yoga9.fritz.box ([88.130.60.234]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mdeb5-1pTWbv3abJ-00ZfX9; Sun, 13
 Nov 2022 13:13:10 +0100
From:   Philipp Jungkamp <p.jungkamp@gmx.net>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org,
        Philipp Jungkamp <p.jungkamp@gmx.net>
Subject: [PATCH v2 1/2] platform/x86: wmi: Disambiguate WMI event data on some ACPI tables
Date:   Sun, 13 Nov 2022 13:12:58 +0100
Message-Id: <20221113121259.14895-1-p.jungkamp@gmx.net>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <8d54fbbb-0933-aaea-5f66-bb7807f5506d@redhat.com>
References: <8d54fbbb-0933-aaea-5f66-bb7807f5506d@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Ag1WeeyxHI0VkPnjYfkofYqsORYfpJLVynLgsT5Iz5bzG2BfBGi
 5ZkAMB4tkei/098CJQ2ggkzPaAO7ym6mQ39XaR64C63rjrIQjGkLOmpNZ3dREiYHtfLomJA
 vLGyGYydlBGUPEPslfiYdeb+CEpFwE/iXIkeJYcBBQf+EvfRlMkLS0xEK3SI63UQfJfCXuQ
 v8J25zz77/+7C2KPyxEDg==
UI-OutboundReport: notjunk:1;M01:P0:5F3rtlBct/0=;aO8N5tj4+yitFE0QImHaUTv7Jb1
 pfldbUCEVCQbMjPYeO6N0T5lshjmXXWpjvpP60EGfplVoOlFIGFhGZpbi0bVvxLOOC6G1Jtu+
 0zJydnK1kOK3p/8QWXYpvW1T5ItNMi++ii9Vm2EE/pKbrBvUDj2dmmS4rx3CdDy54t0Emc1rh
 LBPpd7FeuRhy8o16OLi6nh8jsyXMMBUD57+82/Gf4xjLisISOB/CwueXYZ79SSBsaf3WRfTh4
 M5CEwnbHflPwGw9GPNWqSc2kVp8f/aGy+Wu9iOqnq0MUhQ0egj96Atn6dDDbk5JT6lKf89VcS
 AO8G/+z6CdFk2phwfPpD0jGZr6oq8Z5bnmXwN+WV+lnYRRsNKJBG6oTXT1agfSpSal7U1RGOh
 3de4shngRIx8agyzME0a7bnG9JpPVIMNZU+roIBS/3hD4rv43HvNFg2+M4MQHOYC422ngpbvt
 5NjKbrZmRUkrkx84B+SyTdblEUpwQnZDSqtG8kTOWxNzOnHYowkMOuJAagKy6qI+76iMlXtJO
 w/oX7TOooLrbEC2CGNvHNNecBl3aez2arCuWhjIw/RwGdtUcZhfbtg8sLkkb3nQ+aNuzhz7Pc
 uFjRAL1hT9Hjc1+Hv4sDkWP8DIIat0sXl40zZD99Nxc6oXE81xR9NsHYMcqfpIeahTIPM38w6
 PGu7PDQFDuqS0OykcKxEdiFIrAzRHHBBSMut5StOXzyex9KsOnpUtWsXA4x2p3nUXY5bJTrVB
 izvahqb2FMXgMJpPVU5K+/M4oiHvmsC2ONH97wnZc2IP0b323r43EvpBpEPtfgVwHBPGY3CJs
 Fb1HEAAD4NPhm7Ab7te0DgCwEpSBhpQqglBIFbn1XYAQ5YGpkPgRcWR7bQHN5oNgFVjeoS7bA
 GNV4Ca1mchYoBzMm7mE++b7lzYicrzh5+Gfh6lS107R7hUhi6Op2P1J8YmqA2we639PsXnh8y
 natU1v+sUBHBJQ3AksakZVXDhuA=
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The ACPI DSDT table includes multiple WMI blocks which emit events with
the same notify_id. The wmi_get_event_data() function chooses the
wmi_block with the _WED handler to call based on the notify_id. This
function may call the wrong _WED event handler based on the order the
WMI blocks are parsed.

This introduces wmi_get_event_data_with_guid() to diambiguate the _WED
call to get metadata for an event. The GUID here is the one of the
containing WMI block, not the one of the WMI event itself.

Signed-off-by: Philipp Jungkamp <p.jungkamp@gmx.net>
=2D--
Was separating this change into it's own commit correct?

 drivers/platform/x86/wmi.c | 30 ++++++++++++++++++++++++++++++
 include/linux/acpi.h       |  3 +++
 2 files changed, 33 insertions(+)

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index 223550a10d4d..56b666f4b40b 100644
=2D-- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -659,6 +659,36 @@ acpi_status wmi_get_event_data(u32 event, struct acpi=
_buffer *out)
 }
 EXPORT_SYMBOL_GPL(wmi_get_event_data);

+/**
+ * wmi_get_event_data_with_guid - Get WMI data associated with an event b=
y guid
+ *
+ * Consider using this instead of wmi_get_event_data() when the notify_id
+ * of the WMI event may not be unique among all WMI blocks of a device.
+ *
+ * @guid: GUID of the WMI block for this event
+ * @event: Event to find
+ * @out: Buffer to hold event data. out->pointer should be freed with kfr=
ee()
+ *
+ * Returns extra data associated with an event in WMI.
+ */
+acpi_status wmi_get_event_data_with_guid(const char *guid, u32 event, str=
uct acpi_buffer *out)
+{
+	struct wmi_block *wblock =3D NULL;
+	struct guid_block *gblock;
+	acpi_status status;
+
+	status =3D find_guid(guid, &wblock);
+	if (ACPI_FAILURE(status))
+		return AE_NOT_FOUND;
+
+	gblock =3D &wblock->gblock;
+	if ((gblock->flags & ACPI_WMI_EVENT) && gblock->notify_id =3D=3D event)
+		return get_event_data(wblock, out);
+
+	return AE_NOT_FOUND;
+}
+EXPORT_SYMBOL_GPL(wmi_get_event_data_with_guid);
+
 /**
  * wmi_has_guid - Check if a GUID is available
  * @guid_string: 36 char string of the form fa50ff2b-f2e8-45de-83fa-65417=
f2f49ba
diff --git a/include/linux/acpi.h b/include/linux/acpi.h
index 3015235d65e3..51ac4d6bcae1 100644
=2D-- a/include/linux/acpi.h
+++ b/include/linux/acpi.h
@@ -423,6 +423,9 @@ extern acpi_status wmi_set_block(const char *guid, u8 =
instance,
 extern acpi_status wmi_install_notify_handler(const char *guid,
 					wmi_notify_handler handler, void *data);
 extern acpi_status wmi_remove_notify_handler(const char *guid);
+extern acpi_status wmi_get_event_data_with_guid(const char *guid,
+						u32 event,
+						struct acpi_buffer *out);
 extern acpi_status wmi_get_event_data(u32 event, struct acpi_buffer *out)=
;
 extern bool wmi_has_guid(const char *guid);
 extern char *wmi_get_acpi_device_uid(const char *guid);
=2D-
2.38.1

