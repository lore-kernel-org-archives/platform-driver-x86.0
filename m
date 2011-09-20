From: David Herrmann <dh.herrmann@googlemail.com>
Subject: Re: [patch 5/8] Platform: Fix error path in samsung-laptop init
Date: Tue, 20 Sep 2011 14:21:54 +0200
Message-ID: <CANq1E4TNagJzwLdUXTtR6ZGNJnbb6ppoP0-7mAoN7JUUTYpAVg@mail.gmail.com>
References: <20110901225401.GA26870@kroah.com>
	<20110901225331.122692921@clark.kroah.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:32985 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752913Ab1ITMV4 convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 20 Sep 2011 08:21:56 -0400
In-Reply-To: <20110901225331.122692921@clark.kroah.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: gregkh@suse.de
Cc: Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, greg@kroah.com, stable <stable@kernel.org>

Hi Greg

On Fri, Sep 2, 2011 at 12:50 AM,  <gregkh@suse.de> wrote:
> samsung_init() should not return success if not all devices are initi=
alized.
> Otherwise, samsung_exit() will dereference sdev NULL pointers and oth=
ers.
>
> Signed-off-by: David Herrmann <dh.herrmann@googlemail.com>
> Cc: stable <stable@kernel.org>
> Signed-off-by: Greg Kroah-Hartman <gregkh@suse.de>
> ---
> =A0drivers/platform/x86/samsung-laptop.c | =A0 =A03 +--
> =A01 file changed, 1 insertion(+), 2 deletions(-)
>
> --- a/drivers/platform/x86/samsung-laptop.c
> +++ b/drivers/platform/x86/samsung-laptop.c
> @@ -799,7 +799,7 @@ static int __init samsung_init(void)
> =A0 =A0 =A0 =A0sabi_iface =3D ioremap_nocache(ifaceP, 16);
> =A0 =A0 =A0 =A0if (!sabi_iface) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pr_err("Can't remap %x\n", ifaceP);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto exit;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto error_no_signature;
> =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0if (debug) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0printk(KERN_DEBUG "ifaceP =3D 0x%08x\n=
", ifaceP);
> @@ -851,7 +851,6 @@ static int __init samsung_init(void)
> =A0 =A0 =A0 =A0if (retval)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto error_file_create;
>
> -exit:
> =A0 =A0 =A0 =A0return 0;
>
> =A0error_file_create:
>
>
>

"From: " line is missing in this patch and several others of this
series. "git am" applies them with an email only so Matthew needs to
fix them when applying them or you could just resend them with
git-format-patch?

Thanks and regards
David
