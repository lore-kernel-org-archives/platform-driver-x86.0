From: Gabriele Mazzotta <gabriele.mzt@gmail.com>
Subject: Re: [PATCH v2 0/2] Fixes for dell-wmi
Date: Tue, 12 Jan 2016 01:30:44 +0100
Message-ID: <CABFtUbT2a+x7NDmY9cFaLXh4fSN2VGnLgrNCrjOJ3_XiobuC4A@mail.gmail.com>
References: <1450991926-20937-1-git-send-email-pali.rohar@gmail.com>
	<1451942796-26574-1-git-send-email-pali.rohar@gmail.com>
	<20160111192251.GG10643@malice.jf.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160111192251.GG10643@malice.jf.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>, Matthew Garrett <mjg59@srcf.ucam.org>, =?UTF-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>, Andy Lutomirski <luto@kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

2016-01-11 20:22 GMT+01:00 Darren Hart <dvhart@infradead.org>:
> On Mon, Jan 04, 2016 at 10:26:34PM +0100, Pali Roh=C3=A1r wrote:
>> This patch series adds check if Dell WMI descriptor structure is val=
id and
>> fixes processing WMI events on devices with WMI interface version 0.
>>
>> After testing, second patch is good candidate for backporting into s=
table
>> kernels, but problem is that it cannot be used without first patch. =
So I
>> let decision to other people.
>>
>> Pali Roh=C3=A1r (2):
>>   dell-wmi: Check if Dell WMI descriptor structure is valid
>>   dell-wmi: Process only one event on devices with interface version=
 0
>>
>>  drivers/platform/x86/dell-wmi.c |   96 ++++++++++++++++++++++++++++=
++++++++++-
>>  1 file changed, 94 insertions(+), 2 deletions(-)
>
> Thank you everyone. I have queued these to testing.
>
> Should I add a tested-by for Michal, Andy, and Gabriele?

I tested both the patches, but I'm actually touched only by the
first one. So at least of that one

Tested-by: Gabriele Mazzotta <gabriele.mzt@gmail.com>

> Do I have any Reviewed-by's to add?
>
> --
> Darren Hart
> Intel Open Source Technology Center
