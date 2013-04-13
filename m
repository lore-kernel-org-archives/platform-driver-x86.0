From: Kyle Evans <kvans32@gmail.com>
Subject: Re: BUG: Fn keys not working on EliteBook 8460p after fabf85e3ca15d5b94058f391dac8df870cdd427a
Date: Sat, 13 Apr 2013 08:36:57 -0400
Message-ID: <51695169.6090306@gmail.com>
References: <201304130331.18301@pali> <1365816906.13667.6.camel@x230.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1365816906.13667.6.camel@x230.lan>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthew Garrett <matthew.garrett@nebula.com>
Cc: =?UTF-8?B?UGFsaSBSb2jDoXI=?= <pali.rohar@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

Sure, sorry about that. I was hoping the GUID would be enough. I'll see=
=20
what I can come up with.

On 04/12/2013 09:35 PM, Matthew Garrett wrote:
> On Sat, 2013-04-13 at 03:31 +0200, Pali Roh=C3=A1r wrote:
>
>> all Fn keys, wifi switch, web and mute buttons not working anymore
>> on my notebook HP EliteBook 8460p. I bisected git commit which
>> broke all above keys: fabf85e3ca15d5b94058f391dac8df870cdd427a
>>
>> When I reverted that commit after reboot buttons started working
>> again. Can you fix it or revert that broken commit? This is
>> critical problem, which caused my notebook to be unusable...
> Sure, I'll revert that. Kyle, can you look into figuring out a way to
> only run this on machines that need it?
>
