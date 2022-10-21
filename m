Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C64FEFA373D
	for <platform-driver-x86@archiver.kernel.org>; Fri, 21 Oct 2022 18:17:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229928AbiJUSRk (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 21 Oct 2022 14:17:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230056AbiJUSRj (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 21 Oct 2022 14:17:39 -0400
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37707275DD7
        for <platform-driver-x86@vger.kernel.org>; Fri, 21 Oct 2022 11:17:38 -0700 (PDT)
Date:   Fri, 21 Oct 2022 18:17:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail3; t=1666376255; x=1666635455;
        bh=hU1jG4+4bfiyz3ps13nOs9qtdN8m1L3HJlbHb0yOj2I=;
        h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
         Subject:Reply-To:Feedback-ID:Message-ID;
        b=Ow/SF+2FWRRi6f/ZKZ2VoEYQniMW7hnRH3t79MbNsb3tmkqvfDK+WpbzZNecRI6zZ
         PHHJkyHXivYJykYhKVxPYATJ9Pn3dwt5ovUQqKQa0pf9d6palcK5y2rKCCEzUkhvhf
         v9cn6oFw0ca/4RPKwvU8s9i2FwhtJKFFA/Vr2QkaOEUbV4oYmQrN1fzgYEQfcdiGg4
         2dZPVUbGsAFjrFp8nNrM4sHjtQYypqknMjV1eprygS/zQ+L7e0APPr+QSXJdynQNn9
         M8TvNvKuLSTFtz9DfUEkzHPxAIj0DAlNJ5X2a5r6K5emK5YF4kH2XP/no3Vlm5wtR5
         qTxcEf0hsMohA==
To:     platform-driver-x86@vger.kernel.org,
        ibm-acpi-devel@lists.sourceforge.net,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Henrique de Moraes Holschuh <hmh@hmh.eng.br>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [PATCH v1] platform/x86: thinkpad_acpi: use strstarts()
Message-ID: <20221021180007.55535-1-pobrn@protonmail.com>
Feedback-ID: 20568564:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

There is a function, `strstarts()`, in linux/string.h
to check if a string is prefix of another. So remove
the custom version from the driver.

Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 58 +++++++++++++---------------
 1 file changed, 27 insertions(+), 31 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/th=
inkpad_acpi.c
index 6a823b850a77..7a1d5402697e 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -263,9 +263,6 @@ enum tpacpi_hkey_event_t {
 #define TPACPI_DBG_BRGHT=090x0020
 #define TPACPI_DBG_MIXER=090x0040

-#define strlencmp(a, b) (strncmp((a), (b), strlen(b)))
-
-
 /*************************************************************************=
***
  * Driver-wide structs and misc. variables
  */
@@ -1333,9 +1330,9 @@ static int tpacpi_rfk_procfs_write(const enum tpacpi_=
rfk_id id, char *buf)
 =09=09return -ENODEV;

 =09while ((cmd =3D strsep(&buf, ","))) {
-=09=09if (strlencmp(cmd, "enable") =3D=3D 0)
+=09=09if (strstarts(cmd, "enable"))
 =09=09=09status =3D TPACPI_RFK_RADIO_ON;
-=09=09else if (strlencmp(cmd, "disable") =3D=3D 0)
+=09=09else if (strstarts(cmd, "disable"))
 =09=09=09status =3D TPACPI_RFK_RADIO_OFF;
 =09=09else
 =09=09=09return -EINVAL;
@@ -4196,12 +4193,12 @@ static int hotkey_write(char *buf)

 =09res =3D 0;
 =09while ((cmd =3D strsep(&buf, ","))) {
-=09=09if (strlencmp(cmd, "enable") =3D=3D 0) {
+=09=09if (strstarts(cmd, "enable")) {
 =09=09=09hotkey_enabledisable_warn(1);
-=09=09} else if (strlencmp(cmd, "disable") =3D=3D 0) {
+=09=09} else if (strstarts(cmd, "disable")) {
 =09=09=09hotkey_enabledisable_warn(0);
 =09=09=09res =3D -EPERM;
-=09=09} else if (strlencmp(cmd, "reset") =3D=3D 0) {
+=09=09} else if (strstarts(cmd, "reset")) {
 =09=09=09mask =3D (hotkey_all_mask | hotkey_source_mask)
 =09=09=09=09& ~hotkey_reserved_mask;
 =09=09} else if (sscanf(cmd, "0x%x", &mask) =3D=3D 1) {
@@ -5223,33 +5220,33 @@ static int video_write(char *buf)
 =09disable =3D 0;

 =09while ((cmd =3D strsep(&buf, ","))) {
-=09=09if (strlencmp(cmd, "lcd_enable") =3D=3D 0) {
+=09=09if (strstarts(cmd, "lcd_enable")) {
 =09=09=09enable |=3D TP_ACPI_VIDEO_S_LCD;
-=09=09} else if (strlencmp(cmd, "lcd_disable") =3D=3D 0) {
+=09=09} else if (strstarts(cmd, "lcd_disable")) {
 =09=09=09disable |=3D TP_ACPI_VIDEO_S_LCD;
-=09=09} else if (strlencmp(cmd, "crt_enable") =3D=3D 0) {
+=09=09} else if (strstarts(cmd, "crt_enable")) {
 =09=09=09enable |=3D TP_ACPI_VIDEO_S_CRT;
-=09=09} else if (strlencmp(cmd, "crt_disable") =3D=3D 0) {
+=09=09} else if (strstarts(cmd, "crt_disable")) {
 =09=09=09disable |=3D TP_ACPI_VIDEO_S_CRT;
 =09=09} else if (video_supported =3D=3D TPACPI_VIDEO_NEW &&
-=09=09=09   strlencmp(cmd, "dvi_enable") =3D=3D 0) {
+=09=09=09   strstarts(cmd, "dvi_enable")) {
 =09=09=09enable |=3D TP_ACPI_VIDEO_S_DVI;
 =09=09} else if (video_supported =3D=3D TPACPI_VIDEO_NEW &&
-=09=09=09   strlencmp(cmd, "dvi_disable") =3D=3D 0) {
+=09=09=09   strstarts(cmd, "dvi_disable")) {
 =09=09=09disable |=3D TP_ACPI_VIDEO_S_DVI;
-=09=09} else if (strlencmp(cmd, "auto_enable") =3D=3D 0) {
+=09=09} else if (strstarts(cmd, "auto_enable")) {
 =09=09=09res =3D video_autosw_set(1);
 =09=09=09if (res)
 =09=09=09=09return res;
-=09=09} else if (strlencmp(cmd, "auto_disable") =3D=3D 0) {
+=09=09} else if (strstarts(cmd, "auto_disable")) {
 =09=09=09res =3D video_autosw_set(0);
 =09=09=09if (res)
 =09=09=09=09return res;
-=09=09} else if (strlencmp(cmd, "video_switch") =3D=3D 0) {
+=09=09} else if (strstarts(cmd, "video_switch")) {
 =09=09=09res =3D video_outputsw_cycle();
 =09=09=09if (res)
 =09=09=09=09return res;
-=09=09} else if (strlencmp(cmd, "expand_toggle") =3D=3D 0) {
+=09=09} else if (strstarts(cmd, "expand_toggle")) {
 =09=09=09res =3D video_expand_toggle();
 =09=09=09if (res)
 =09=09=09=09return res;
@@ -5642,9 +5639,9 @@ static int light_write(char *buf)
 =09=09return -ENODEV;

 =09while ((cmd =3D strsep(&buf, ","))) {
-=09=09if (strlencmp(cmd, "on") =3D=3D 0) {
+=09=09if (strstarts(cmd, "on")) {
 =09=09=09newstatus =3D 1;
-=09=09} else if (strlencmp(cmd, "off") =3D=3D 0) {
+=09=09} else if (strstarts(cmd, "off")) {
 =09=09=09newstatus =3D 0;
 =09=09} else
 =09=09=09return -EINVAL;
@@ -7115,10 +7112,10 @@ static int brightness_write(char *buf)
 =09=09return level;

 =09while ((cmd =3D strsep(&buf, ","))) {
-=09=09if (strlencmp(cmd, "up") =3D=3D 0) {
+=09=09if (strstarts(cmd, "up")) {
 =09=09=09if (level < bright_maxlvl)
 =09=09=09=09level++;
-=09=09} else if (strlencmp(cmd, "down") =3D=3D 0) {
+=09=09} else if (strstarts(cmd, "down")) {
 =09=09=09if (level > 0)
 =09=09=09=09level--;
 =09=09} else if (sscanf(cmd, "level %d", &level) =3D=3D 1 &&
@@ -7867,13 +7864,13 @@ static int volume_write(char *buf)

 =09while ((cmd =3D strsep(&buf, ","))) {
 =09=09if (!tp_features.mixer_no_level_control) {
-=09=09=09if (strlencmp(cmd, "up") =3D=3D 0) {
+=09=09=09if (strstarts(cmd, "up")) {
 =09=09=09=09if (new_mute)
 =09=09=09=09=09new_mute =3D 0;
 =09=09=09=09else if (new_level < TP_EC_VOLUME_MAX)
 =09=09=09=09=09new_level++;
 =09=09=09=09continue;
-=09=09=09} else if (strlencmp(cmd, "down") =3D=3D 0) {
+=09=09=09} else if (strstarts(cmd, "down")) {
 =09=09=09=09if (new_mute)
 =09=09=09=09=09new_mute =3D 0;
 =09=09=09=09else if (new_level > 0)
@@ -7885,9 +7882,9 @@ static int volume_write(char *buf)
 =09=09=09=09continue;
 =09=09=09}
 =09=09}
-=09=09if (strlencmp(cmd, "mute") =3D=3D 0)
+=09=09if (strstarts(cmd, "mute"))
 =09=09=09new_mute =3D TP_EC_AUDIO_MUTESW_MSK;
-=09=09else if (strlencmp(cmd, "unmute") =3D=3D 0)
+=09=09else if (strstarts(cmd, "unmute"))
 =09=09=09new_mute =3D 0;
 =09=09else
 =09=09=09return -EINVAL;
@@ -9110,10 +9107,9 @@ static int fan_write_cmd_level(const char *cmd, int =
*rc)
 {
 =09int level;

-=09if (strlencmp(cmd, "level auto") =3D=3D 0)
+=09if (strstarts(cmd, "level auto"))
 =09=09level =3D TP_EC_FAN_AUTO;
-=09else if ((strlencmp(cmd, "level disengaged") =3D=3D 0) ||
-=09=09=09(strlencmp(cmd, "level full-speed") =3D=3D 0))
+=09else if (strstarts(cmd, "level disengaged") || strstarts(cmd, "level fu=
ll-speed"))
 =09=09level =3D TP_EC_FAN_FULLSPEED;
 =09else if (sscanf(cmd, "level %d", &level) !=3D 1)
 =09=09return 0;
@@ -9131,7 +9127,7 @@ static int fan_write_cmd_level(const char *cmd, int *=
rc)

 static int fan_write_cmd_enable(const char *cmd, int *rc)
 {
-=09if (strlencmp(cmd, "enable") !=3D 0)
+=09if (!strstarts(cmd, "enable"))
 =09=09return 0;

 =09*rc =3D fan_set_enable();
@@ -9146,7 +9142,7 @@ static int fan_write_cmd_enable(const char *cmd, int =
*rc)

 static int fan_write_cmd_disable(const char *cmd, int *rc)
 {
-=09if (strlencmp(cmd, "disable") !=3D 0)
+=09if (!strstarts(cmd, "disable"))
 =09=09return 0;

 =09*rc =3D fan_set_disable();
--
2.38.1


