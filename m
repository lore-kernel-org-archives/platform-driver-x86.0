Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51FBCC7618E
	for <platform-driver-x86@archiver.kernel.org>; Thu, 20 Apr 2023 23:32:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233162AbjDTXcq (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 20 Apr 2023 19:32:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233140AbjDTXcp (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 20 Apr 2023 19:32:45 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C919A2107;
        Thu, 20 Apr 2023 16:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1682033553; i=w_armin@gmx.de;
        bh=lBlH3Nqi1jLnfe9btNEPKUJFG01pfHUJIbiEyZ5yxSg=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=c0dstfSuk4NeeOx1PQgcJfY3VxSaByKAjVTuitnvV7nedovVGBsyMaBwQY9IyEK27
         h+OGdS0ZxNRM4etWsP43VE7yOXII5jn/u7+r1gSDGZOCRjdPZJx/ptBFn0xP1nL0qm
         xDbqlY3tTIUMphz2X8x+/BEPcKgen5zMy3jl96LLvaC8ewdoGDhIE/JtysdB/o1YDr
         dRIKVo5+rRq9NfOQ2ccWvvgR6SfgCHuC48GlE4VubTFCf1EvNCOZkBcelCqtbLhXEF
         R3rSWckSE+Ocd0Rhg+BQHqDUhWhPb26qswwlc5GPEi/ZfUo80+tevfBbT2oXF26mhG
         urlWuqKHdFeJA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from esprimo-mx.users.agdsn.de ([141.30.226.129]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MyKHc-1qEkG43U20-00yisi; Fri, 21 Apr 2023 01:32:32 +0200
From:   Armin Wolf <W_Armin@gmx.de>
To:     hdegoede@redhat.com, markgross@kernel.org
Cc:     corbet@lwn.net, linux-doc@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] platform/x86: wmi: Mark GUID-based WMI interface as deprecated
Date:   Fri, 21 Apr 2023 01:32:24 +0200
Message-Id: <20230420233226.14561-3-W_Armin@gmx.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230420233226.14561-1-W_Armin@gmx.de>
References: <20230420233226.14561-1-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:RBUmnkT160ZlZvaFUSraNtW7l69Wx+0qemSgMJs8biaVxgGN68p
 QpYwBC6DA0o1Bk64jCsHOAhMTjQBgNJfAtQG+Oc/CmMA3lOXJUEenEZKhPySv9V4FVRgBul
 D04LYeET509qXW/AAHJj/+uEIPZNrDeyeWeJWDj+E6Jzk4vkUZSQhoU008oqqsvMkhc56wr
 Pm1o81a3rv2yenqpngztQ==
UI-OutboundReport: notjunk:1;M01:P0:RXLP46U4J1w=;7sV2VB/mGCtehhbbtZGn6u/bpZB
 t2MXkbH+SeKrLEFhQQOnBHLHhgxokCerpiHsVA/nVnpRtxvn3/eDRcD2QNKbK9IylMUdTco1d
 lhxfcfQet5dbWKJT8F/FB8p0cyFtXt+oMPqXZ+0J+bP+yiaU32iKv+Fgqsrh1WFqF5ygTp9pw
 QcoGJC6L15EKqDR9TZFVDjDNvmqpAI9xBD5whtc8F8HjJ81MsxHFA9sfRx8XgmOUewiKE6jwo
 /VofFt2T5DfJNqJVsb0Gr8ZWqW9c+/2TAWWqid5e7X28VEjK5POx8adrpFecHZXpLCV7aOYuS
 OfKfX5JB3yW86UK191Ymb24OJAuvasjaeeO+CX6GdZEe8vstoMnWikoYYjzVKGA5iVFL1SXS5
 EN2K4b86YGqFLaDIwuZlywaTspP6bedWG8zPcKXeqxpVo9h5KuI3cZ7T4sqQLwS/M9zFfBhJz
 Bos+S1dYnupyVzHRnbpItGUCCdAKsc7Fa1QfC7iajLfsQizTvS/Y8k2msy8QsSshm1lKmbdxX
 N5ZtPW5rnfR91/XYgq5UIXwUOnruVS93lCreoT0eyrLOaL9InjvBeHqn068iPfb7kjmtsdVGp
 yISmA7KiaiXQ/GxQaoTVlDWuSsRbZRIsEsPAFNuOCQ4rJOcmm4cITKiHV9MV4qaIACDtyucyO
 mrSS2LmxrePUEEMQ9jcQta7U9Zbk8KGQWG+G1KyB5WxOFS8j5Wf038twQ/0IN3yXTFX5dHcHF
 4HgFxiknS5SdaY8ZJ7UAemW2XsYQKtUBpn6wdJFaez7O7iDP72a54IsypfxnkMOuQrBF4FcMP
 zz9UsSRHC1gpKynDKZ1UTZDH84V0czT3+9npeMm9MJCva/2d4mv8lQJ0fKfgX4O0dA1sfqbFb
 i95iMat9+cDY9Hn5H9XBS1Yj7tmgD2IUDmQXuUlVId3znyIqC8mh6kIrMedYDQFKzTVdSf9zl
 MZRnnFMkAQH+WlpaqGTz6SsB13Y=
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The WMI driver core supports a more mordern bus-based interface for
interacting with WMI devices. The older GUID-based interface depends
on each WMI GUID and notification id being unique on a given system,
which turned out is not the case.
Mark the older interface as deprecated since new WMI drivers should
use the bus-based interface to avoid this issues.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/platform/x86/wmi.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index e4b41dca70c7..ae654487718e 100644
=2D-- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -264,7 +264,7 @@ int set_required_buffer_size(struct wmi_device *wdev, =
u64 length)
 EXPORT_SYMBOL_GPL(set_required_buffer_size);

 /**
- * wmi_evaluate_method - Evaluate a WMI method
+ * wmi_evaluate_method - Evaluate a WMI method (deprecated)
  * @guid_string: 36 char string of the form fa50ff2b-f2e8-45de-83fa-65417=
f2f49ba
  * @instance: Instance index
  * @method_id: Method ID to call
@@ -457,7 +457,7 @@ union acpi_object *wmidev_block_query(struct wmi_devic=
e *wdev, u8 instance)
 EXPORT_SYMBOL_GPL(wmidev_block_query);

 /**
- * wmi_set_block - Write to a WMI block
+ * wmi_set_block - Write to a WMI block (deprecated)
  * @guid_string: 36 char string of the form fa50ff2b-f2e8-45de-83fa-65417=
f2f49ba
  * @instance: Instance index
  * @in: Buffer containing new values for the data block
@@ -568,7 +568,7 @@ static void wmi_notify_debug(u32 value, void *context)
 }

 /**
- * wmi_install_notify_handler - Register handler for WMI events
+ * wmi_install_notify_handler - Register handler for WMI events (deprecat=
ed)
  * @guid: 36 char string of the form fa50ff2b-f2e8-45de-83fa-65417f2f49ba
  * @handler: Function to handle notifications
  * @data: Data to be returned to handler when event is fired
@@ -614,7 +614,7 @@ acpi_status wmi_install_notify_handler(const char *gui=
d,
 EXPORT_SYMBOL_GPL(wmi_install_notify_handler);

 /**
- * wmi_remove_notify_handler - Unregister handler for WMI events
+ * wmi_remove_notify_handler - Unregister handler for WMI events (depreca=
ted)
  * @guid: 36 char string of the form fa50ff2b-f2e8-45de-83fa-65417f2f49ba
  *
  * Unregister handler for events sent to the ACPI-WMI mapper device.
@@ -661,7 +661,7 @@ acpi_status wmi_remove_notify_handler(const char *guid=
)
 EXPORT_SYMBOL_GPL(wmi_remove_notify_handler);

 /**
- * wmi_get_event_data - Get WMI data associated with an event
+ * wmi_get_event_data - Get WMI data associated with an event (deprecated=
)
  *
  * @event: Event to find
  * @out: Buffer to hold event data
@@ -700,7 +700,7 @@ bool wmi_has_guid(const char *guid_string)
 EXPORT_SYMBOL_GPL(wmi_has_guid);

 /**
- * wmi_get_acpi_device_uid() - Get _UID name of ACPI device that defines =
GUID
+ * wmi_get_acpi_device_uid() - Get _UID name of ACPI device that defines =
GUID (deprecated)
  * @guid_string: 36 char string of the form fa50ff2b-f2e8-45de-83fa-65417=
f2f49ba
  *
  * Find the _UID of ACPI device associated with this WMI GUID.
=2D-
2.30.2

