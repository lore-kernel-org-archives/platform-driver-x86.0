From: Chris Bagwell <chris@cnpbagwell.com>
Subject: Re: [PATCH 00/10] eeepc-wmi: updates for 2.6.38
Date: Sun, 5 Dec 2010 20:55:59 -0600
Message-ID: <AANLkTi=eangKVLf1sQsk-tL9GeFE4Mw3S9ZPk6YzsAU0@mail.gmail.com>
References: <1291014854-17961-1-git-send-email-corentincj@iksaif.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-gy0-f174.google.com ([209.85.160.174]:65238 "EHLO
	mail-gy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751468Ab0LFC4A convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 5 Dec 2010 21:56:00 -0500
Received: by gyb11 with SMTP id 11so5752527gyb.19
        for <platform-driver-x86@vger.kernel.org>; Sun, 05 Dec 2010 18:55:59 -0800 (PST)
In-Reply-To: <1291014854-17961-1-git-send-email-corentincj@iksaif.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentincj@iksaif.net>
Cc: platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg@redhat.com>, "David S. Miller" <davem@davemloft.net>, Yong Wang <yong.y.wang@intel.com>

=46or what its worth, applies cleanly to 2.6.37-rc3 and works with no
regressions on my Eee pc 1005pe.

Tested-by: Chris Bagwell <chris@cnpbagwell.com>

Chris

On Mon, Nov 29, 2010 at 1:14 AM, Corentin Chary <corentincj@iksaif.net>=
 wrote:
> Hi,
>
> I finally got a WMI aware Eeepc on my desk, so I made a quick
> series to add missing features to eeepc-wmi. Theses patchs were done
> and tested on an Eeepc 1005PE with an updated BIOS.
>
> Thanks,
>
> Corentin Chary (10):
> =A0eeepc-wmi: rework eeepc_wmi_init and eeepc_wmi_exit
> =A0eeepc-wmi: add touchpad led support
> =A0eeepc-wmi: add rfkill support for wlan, bluetooth and 3g
> =A0eeepc-wmi: use attribute group to manage attributes
> =A0eeepc-wmi: add debugfs entries
> =A0eeepc-wmi: fix confusion between ctrl_param and retval
> =A0eeepc-wmi: claim eeepc-wmi maintainership
> =A0eeepc-wmi: remove unneeded static
> =A0eeepc-laptop: add a getter for touchpad led
> =A0eeepc-wmi: never load if legacy device is enabled
>
> =A0MAINTAINERS =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =
=A08 +
> =A0drivers/platform/x86/Kconfig =A0 =A0 =A0 =A0| =A0 =A03 +
> =A0drivers/platform/x86/eeepc-laptop.c | =A0 11 +
> =A0drivers/platform/x86/eeepc-wmi.c =A0 =A0| =A0609 +++++++++++++++++=
+++++++++++++----
> =A04 files changed, 559 insertions(+), 72 deletions(-)
>
> --
> 1.7.3.2
>
> --
> To unsubscribe from this list: send the line "unsubscribe platform-dr=
iver-x86" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
