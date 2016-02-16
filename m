From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v3 5/5] dell-wmi: support Dell Inspiron M5110
Date: Tue, 16 Feb 2016 16:22:46 +0100
Message-ID: <20160216152246.GL1476@pali>
References: <20160121090401.GR7192@pali>
 <1455634230-1487-1-git-send-email-kernel@kempniu.pl>
 <1455634230-1487-6-git-send-email-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f53.google.com ([74.125.82.53]:34617 "EHLO
	mail-wm0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751162AbcBPPWs (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 16 Feb 2016 10:22:48 -0500
Content-Disposition: inline
In-Reply-To: <1455634230-1487-6-git-send-email-kernel@kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, Darek Stojaczyk <darek.stojaczyk@gmail.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Tuesday 16 February 2016 15:50:30 Micha=C5=82 K=C4=99pie=C5=84 wrote=
:
>  	/* Shortcut and audio panel keys */
>  	{ KE_KEY, 0xe025, { KEY_PROG4 } },
>  	{ KE_IGNORE, 0xe026, { KEY_RESERVED } },
> +	{ KE_KEY, 0xe029, { KEY_PROG4 } },

Hi! Above comment (Shortcut and audio panel keys) is not relevant for
this 0xe029, right? Then please break this new key from above two and
adds useful comment what is that key.

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com
