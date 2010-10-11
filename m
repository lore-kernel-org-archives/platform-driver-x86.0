From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [PATCH 1/2] eeepc-wmi: add additional hotkeys
Date: Mon, 11 Oct 2010 08:26:22 +0200
Message-ID: <AANLkTin3J3oOaYD8G=YSrBr0AKzw7mY7v0BQssw5z2Z6@mail.gmail.com>
References: <1286761702-4304-1-git-send-email-chris@cnpbagwell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ew0-f46.google.com ([209.85.215.46]:36912 "EHLO
	mail-ew0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752362Ab0JKG0X convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 11 Oct 2010 02:26:23 -0400
Received: by ewy20 with SMTP id 20so439061ewy.19
        for <platform-driver-x86@vger.kernel.org>; Sun, 10 Oct 2010 23:26:22 -0700 (PDT)
In-Reply-To: <1286761702-4304-1-git-send-email-chris@cnpbagwell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: chris@cnpbagwell.com
Cc: platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, yong.y.wang@intel.com

On Mon, Oct 11, 2010 at 3:48 AM,  <chris@cnpbagwell.com> wrote:
> From: Chris Bagwell <chris@cnpbagwell.com>
>
> Added 4 hotkeys using same keymap values as eeepc-latop.
> These are mousepad toggle, resolution change, screen off,
> and task manager. =C2=A0These were tested on 1005PE and are the
> Fn-F3, F4, F7, and F9, respectively.
>
> Also, added a new hot key for power toggles (Fn-Space on 1005PE)
> and is meant to drive cpufv interface from userspace.
>
> Finally, added several keys to be ignored that are being emitted
> but do not mapped to any useful or documented hotkeys. =C2=A0This is
> purely cosmetic to prevent uknown key reports on console/log files.
> These keys are reported on 1005PE's.

What are exactly these keys ? Since they are probably some obscure Fn+ =
combo,
and they are probably used on another model, I'm not sure we should hid=
e them.

I'm still not happy with F13 for "disable touchpad" but I did the same
for other laptops,
and we don't have a key for that ATM.

Otherwise, looks good.
