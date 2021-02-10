Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7562C433DB
	for <platform-driver-x86@archiver.kernel.org>; Wed, 10 Feb 2021 21:49:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ADC0A64DE1
	for <platform-driver-x86@archiver.kernel.org>; Wed, 10 Feb 2021 21:49:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232661AbhBJVth (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 10 Feb 2021 16:49:37 -0500
Received: from mail-40136.protonmail.ch ([185.70.40.136]:63584 "EHLO
        mail-40136.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232392AbhBJVtg (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 10 Feb 2021 16:49:36 -0500
Date:   Wed, 10 Feb 2021 21:48:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1612993730;
        bh=ywi/Qdje8ARyLIm27Q0RCy8KlZwG/JS/oYOHsFd5u08=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=U8k6r89nKIasGuuidnU2OHGmsIZDmK3R4dJpMw0f019/j0mhcJVt86MAhHjH1HqeI
         +iBSkvqpBd7jPMSn646LuiDTEGvqndvlv72ovV2H9GrwyxMKfNBNVzzt09AFtX0D7h
         aKAbeI1vMlz7jr1raV9ncuAecBlgjS92M2hlibQU=
To:     Alexander Kobel <a-kobel@a-kobel.de>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Nitin Joshi1 <njoshi1@lenovo.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        Mark Pearson <mpearson@lenovo.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [PATCH v2] platform/x86: thinkpad_acpi: Handle keyboard cover attach/detach events
Message-ID: <984D5EJD7aHLu4SvKWlumE3xhawPAvBV3B9JezdQhjclDnufeiTOOMInBizd1p_rdhJBgOmjc2sW8Ji00gkmBY1NIMW_weIwVZfgSZefizA=@protonmail.com>
In-Reply-To: <00d3570a-8624-89ca-7216-7d648b0a2f0b@a-kobel.de>
References: <00d3570a-8624-89ca-7216-7d648b0a2f0b@a-kobel.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi


2021. febru=C3=A1r 10., szerda 18:54 keltez=C3=A9ssel, Alexander Kobel =
=C3=ADrta:

> ThinkPad X1 Tablets emit HKEY 0x4012 and 0x4013 events when a keyboard
> cover is attached/detached or folded to the back of the device. They are
> used to switch from normal to tablet mode in userspace; e.g., to offer
> touch keyboard choices when focus goes to a text box and no keyboard is
> attached, or to enable autorotation of the display according to the
> built-in orientation sensor.
>
> This patch handles the two events by issuing corresponding
> SW_TABLET_MODE notifications to the ACPI userspace.
>
> Tested as working on a ThinkPad X1 Tablet Gen 2, 20JCS00C00, and as
> non-interfering with a ThinkPad X1 Carbon 7th, 20QESABM02 (normal
> clamshell, so it does not have a keyboard cover).
>
> Signed-off-by: Alexander Kobel <a-kobel@a-kobel.de>
> ---
>  drivers/platform/x86/thinkpad_acpi.c | 91 +++++++++++++++++++++++++++-
>  1 file changed, 90 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/=
thinkpad_acpi.c
> index c404706379d9..8c1ff555f10b 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -174,6 +174,11 @@ enum tpacpi_hkey_event_t {
>  =09=09=09=09=09=09     or port replicator */
>  =09TP_HKEY_EV_HOTPLUG_UNDOCK=09=3D 0x4011, /* undocked from hotplug
>  =09=09=09=09=09=09     dock or port replicator */
> +=09/* Thinkpad X1 Tablet series (and probably other GTOP type 4) emit 0x=
4012 and 0x4013

The preferred style of multi-line comments is

/* <note the empty line here>
 * Lorem ipsum ...
 */


> +=09 * when keyboard cover is attached, detached or folded onto the back
> +=09 */
> +=09TP_HKEY_EV_KBD_COVER_ATTACH=09=3D 0x4012, /* keyboard cover attached =
*/
> +=09TP_HKEY_EV_KBD_COVER_DETACH=09=3D 0x4013, /* keyboard cover detached =
or folded back */
>
>  =09/* User-interface events */
>  =09TP_HKEY_EV_LID_CLOSE=09=09=3D 0x5001, /* laptop lid closed */
> @@ -308,6 +313,8 @@ static struct {
>  =09=09TP_HOTKEY_TABLET_NONE =3D 0,
>  =09=09TP_HOTKEY_TABLET_USES_MHKG,
>  =09=09TP_HOTKEY_TABLET_USES_GMMS,
> +=09=09TP_HOTKEY_TABLET_USES_GTOP_ANY_TYPE,
> +=09=09TP_HOTKEY_TABLET_USES_GTOP_X1_TABLET_TYPE,
>  =09} hotkey_tablet;
>  =09u32 kbdlight:1;
>  =09u32 light:1;
> @@ -2166,11 +2173,32 @@ static int hotkey_gmms_get_tablet_mode(int s, int=
 *has_tablet_mode)
>  =09return !!(mode & TP_ACPI_MULTI_MODE_TABLET_LIKE);
>  }
>
> +static int hotkey_gtop_any_type_get_tablet_mode(int s)
> +{
> +=09return !(s & 0x1);
> +}

I believe it would be preferable to do something like

  #define TP_GTOP_TYPE_ANY_ATTACH_STATE BIT(0)
  /* or possibly use an enum */
  ...
  return !(s & TP_GTOP_TYPE_ANY_ATTACH_STATE);

or let `s` be `unsigned long`, and then

  #define TP_GTOP_TYPE_ANY_ATTACH_STATE_BIT 0
  ...
  return !test_bit(TP_GTOP_TYPE_ANY_ATTACH_STATE_BIT, &s);

or something along these lines, and I also think the return type could be `=
bool`.


> +
> +static int hotkey_gtop_x1_tablet_type_get_tablet_mode(int s)
> +{
> +=09return (!(s & 0x1) /* keyboard NOT attached */
> +=09=09|| ((s >> 16) & 0x1) /* or folded onto the back */);
> +}

Same here, I suggest using the `BIT()` macro or `test_bit()` and preferably
name the constants.


> +
>  static int hotkey_get_tablet_mode(int *status)
>  {
>  =09int s;
>
>  =09switch (tp_features.hotkey_tablet) {
> +=09case TP_HOTKEY_TABLET_USES_GTOP_ANY_TYPE:
> +=09=09if (!acpi_evalf(hkey_handle, &s, "GTOP", "dd", 0x0200))
> +=09=09=09return -EIO;
> +=09=09*status =3D hotkey_gtop_any_type_get_tablet_mode(s);
> +=09=09break;
> +=09case TP_HOTKEY_TABLET_USES_GTOP_X1_TABLET_TYPE:
> +=09=09if (!acpi_evalf(hkey_handle, &s, "GTOP", "dd", 0x0200))
> +=09=09=09return -EIO;
> +=09=09*status =3D hotkey_gtop_x1_tablet_type_get_tablet_mode(s);
> +=09=09break;
>  =09case TP_HOTKEY_TABLET_USES_MHKG:
>  =09=09if (!acpi_evalf(hkey_handle, &s, "MHKG", "d"))
>  =09=09=09return -EIO;
> @@ -3213,7 +3241,62 @@ static int hotkey_init_tablet_mode(void)
>  =09int in_tablet_mode =3D 0, res;
>  =09char *type =3D NULL;
>
> -=09if (acpi_evalf(hkey_handle, &res, "GMMS", "qdd", 0)) {
> +=09if (acpi_evalf(hkey_handle, &res, "GTOP", "qdd", 0x0000)
> +=09    && res >=3D 0x0103
> +=09    && acpi_evalf(hkey_handle, &res, "GTOP", "qdd", 0x0100)) {

Minor thing, but checkpatch prefers `&&` at the end of the line. And the re=
st of
the code places them at the end, too.


> +=09=09/*
> +=09=09 * GTOP ("Get Tablet OPtion") state ASL method definition:
> +=09=09 * - Input: 0x0000: Query version
> +=09=09 *   Output: 0x0103 (version 1.03)
> +=09=09 * - Input: 0x0100: Query interface type
> +=09=09 *   Output: DWORD But 31-0 Interface type
                                    ^
Shouldn't that be "Bit"?


> +=09=09 *     0: Reserved
> +=09=09 *     1: Any type
> +=09=09 *     2: ThinkPad Helix series
> +=09=09 *     3: ThinkPad 10 series
> +=09=09 *     4: ThinkPad X1 Tablet series
> +=09=09 * - Input: 0x0200: Get attach option
> +=09=09 *   Output: Option attach state
> +=09=09 *     (0: detached, 1: attached)
> +=09=09 *     version >=3D 1.03 and interface type 1:
> +=09=09 *       Bit 0: Any option attach state
> +=09=09 *       Bit 31-1: Reserved(0)
> +=09=09 *     version >=3D 1.03 and interface type 4:
> +=09=09 *       Bit 0: Thin-KBD attach state
> +=09=09 *       Bit 1: Pro-Cartridge attach state
> +=09=09 *       Bit 3-2: Pico-Cartridge attach state
> +=09=09 *         00: detached
> +=09=09 *         01: attached
> +=09=09 *         10: attached with battery error
> +=09=09 *         11: Reserved
> +=09=09 *       Bit 4: 3D Cartridge attach state
> +=09=09 *       Bit 5: Reserve 1 attach state
> +=09=09 *       Bit 6: Reserve 2 attach state
> +=09=09 *       Bit 15-7: Reserved(0)
> +=09=09 *       Bit 16: Folio keyboard location
> +=09=09 *         (valid if folio attached)
> +=09=09 *         0: keyboard is NOT folded onto the back
> +=09=09 *         1: keyboard is folded onto the back of the system
> +=09=09 *       Bit 31-17: Reserved(0)
> +=09=09 */
> +=09=09switch (res) {
> +=09=09case 1:
> +=09=09=09tp_features.hotkey_tablet =3D TP_HOTKEY_TABLET_USES_GTOP_ANY_TY=
PE;
> +=09=09=09if (acpi_evalf(hkey_handle, &res, "GTOP", "qdd", 0x200))

Please name that `0x200` something like TP_GTOP_CMD_GET_ATTACH_STATE or som=
ething
you like. (Same for the rest of the GTOP calls.) I know it's just above in =
the comment,
but I still think it'd be better to have concrete, more or less self-explan=
atory names
in the actual command.


> +=09=09=09=09in_tablet_mode =3D hotkey_gtop_any_type_get_tablet_mode(res)=
;
> +=09=09=09type =3D "GTOP";
> +=09=09=09break;
> +=09=09case 4:
> +=09=09=09tp_features.hotkey_tablet =3D TP_HOTKEY_TABLET_USES_GTOP_X1_TAB=
LET_TYPE;
> +=09=09=09if (acpi_evalf(hkey_handle, &res, "GTOP", "qdd", 0x200))
> +=09=09=09=09in_tablet_mode =3D hotkey_gtop_x1_tablet_type_get_tablet_mod=
e(res);
> +=09=09=09type =3D "GTOP";
> +=09=09=09break;
> +=09=09default:
> +=09=09=09pr_err("unsupported GTOP type, please report this to %s\n", TPA=
CPI_MAIL);
> +=09=09=09break;
> +=09=09}
> +=09} else if (acpi_evalf(hkey_handle, &res, "GMMS", "qdd", 0)) {
>  =09=09int has_tablet_mode;
> [...]


Regards,
Barnab=C3=A1s P=C5=91cze
