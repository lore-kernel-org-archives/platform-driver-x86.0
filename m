From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v2] dell-wmi: Improve unknown hotkey handling
Date: Mon, 23 Nov 2015 20:47:10 +0100
Message-ID: <20151123194710.GJ24147@pali>
References: <a19a018252f8352a5d22934c98fba2954e9b1c6c.1448069061.git.luto@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f45.google.com ([74.125.82.45]:34968 "EHLO
	mail-wm0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753336AbbKWTrN (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 23 Nov 2015 14:47:13 -0500
Received: by wmuu63 with SMTP id u63so68842845wmu.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 23 Nov 2015 11:47:12 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <a19a018252f8352a5d22934c98fba2954e9b1c6c.1448069061.git.luto@kernel.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Lutomirski <luto@kernel.org>
Cc: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>

On Friday 20 November 2015 17:27:00 Andy Lutomirski wrote:
> +		if (keycode =3D=3D KEY_RESERVED) {
> +			pr_info("firmware scancode %d maps to unrecognized keycode %d\n",
> +				bios_entry->scancode, bios_entry->keycode);
> +			continue;
> +		}

Please use "0x%x" instead "%d" for those scan and key codes. Other part=
s
in driver use "0x%x" so that new info message could be more confused if
it has decimal codes...

With that fix, you can add my:
Reviewed-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com
