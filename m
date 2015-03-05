From: Azael Avalos <coproscefalo@gmail.com>
Subject: Re: [PATCH 2/2] toshiba_acpi: Add Satellite P50W-B to alternative
 keymap and create new mappings.
Date: Wed, 4 Mar 2015 17:05:08 -0700
Message-ID: <CAGdLNWEb0yx4Fum8mMnivChFU8NsKkk9RtwmAd1kgQiZSBjk5A@mail.gmail.com>
References: <f550a80e50ed5296cb8bc9b6a536c68c05dc66c6.1425502427.git.joseph.salisbury@canonical.com>
	<2c7d7f26e69b6e28e1f97be2d5021c0c46427d86.1425502427.git.joseph.salisbury@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f178.google.com ([209.85.212.178]:44701 "EHLO
	mail-wi0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751462AbbCEAFJ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 4 Mar 2015 19:05:09 -0500
In-Reply-To: <2c7d7f26e69b6e28e1f97be2d5021c0c46427d86.1425502427.git.joseph.salisbury@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Joseph Salisbury <joseph.salisbury@canonical.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Darren Hart <dvhart@infradead.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, stable@vger.kernel.org

Hi there,

2015-03-04 14:52 GMT-07:00 Joseph Salisbury <joseph.salisbury@canonical.com>:
...
> +       { KE_KEY, 0x140, { KEY_BRIGHTNESSDOWN } },
> +       { KE_KEY, 0x141, { KEY_BRIGHTNESSUP } },
...

These two are not neccesary, as they may collide with "previous song"
and "playpause" in case Toshiba (or its manufacturers) decide to use
those keys.

If you can, please test the first two patches from the gmane archive [1],
they eliminate the need of the DMI matching list. And it would be great
to have more laptops tested.

[1] http://comments.gmane.org/gmane.linux.drivers.platform.x86.devel/6602


Cheers
Azael


-- 
-- El mundo apesta y vosotros apestais tambien --
