From: Joseph Salisbury <joseph.salisbury@canonical.com>
Subject: Re: [PATCH 2/2] toshiba_acpi: Add Satellite P50W-B to alternative
 keymap and create new mappings.
Date: Thu, 05 Mar 2015 07:57:45 -0500
Message-ID: <54F852C9.1010407@canonical.com>
References: <f550a80e50ed5296cb8bc9b6a536c68c05dc66c6.1425502427.git.joseph.salisbury@canonical.com>	<2c7d7f26e69b6e28e1f97be2d5021c0c46427d86.1425502427.git.joseph.salisbury@canonical.com> <CAGdLNWEb0yx4Fum8mMnivChFU8NsKkk9RtwmAd1kgQiZSBjk5A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAGdLNWEb0yx4Fum8mMnivChFU8NsKkk9RtwmAd1kgQiZSBjk5A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Azael Avalos <coproscefalo@gmail.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Darren Hart <dvhart@infradead.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, stable@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On 03/04/2015 07:05 PM, Azael Avalos wrote:
> Hi there,
>
> 2015-03-04 14:52 GMT-07:00 Joseph Salisbury <joseph.salisbury@canonical.com>:
> ...
>> +       { KE_KEY, 0x140, { KEY_BRIGHTNESSDOWN } },
>> +       { KE_KEY, 0x141, { KEY_BRIGHTNESSUP } },
> ...
>
> These two are not neccesary, as they may collide with "previous song"
> and "playpause" in case Toshiba (or its manufacturers) decide to use
> those keys.
>
> If you can, please test the first two patches from the gmane archive [1],
> they eliminate the need of the DMI matching list. And it would be great
> to have more laptops tested.
>
> [1] http://comments.gmane.org/gmane.linux.drivers.platform.x86.devel/6602
>
>
> Cheers
> Azael
>
>
Thanks for the feedback, Azael.  I'll spin up a kernel with the first
two patches in that archive, and have them testing.  I'll reply with the
results.

Thanks again,

Joe
