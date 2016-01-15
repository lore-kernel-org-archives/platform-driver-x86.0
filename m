From: Andy Lutomirski <luto@amacapital.net>
Subject: Re: [PATCH] dell-wmi: Stop storing pointers to DMI tables
Date: Fri, 15 Jan 2016 12:00:02 -0800
Message-ID: <CALCETrWsm1OVuZQNeU-UkcdNg1rt6Wu9CKY=xc_0M9kKzedYYg@mail.gmail.com>
References: <119170b95d373bc943eb4f16818239bac9fa6c59.1451832667.git.luto@kernel.org>
 <CALCETrVZ23t8u34VtgC+VVQC4PQ0JAw2u27+W_MQiwS=BgMAXQ@mail.gmail.com>
 <20160112142538.GB11560@pali> <CALCETrWUJ+5DowyLFDp7N_iNLsday4uKX3iO3NMC8Pfqma=O7w@mail.gmail.com>
 <20160115142719.36eea015@endymion.delvare> <CALCETrWXVxYLP0yTg4hS7JFjccjskvAF79ec6iSZsKJbLYi9GQ@mail.gmail.com>
 <1452880405.4941.0.camel@chaos.site>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1452880405.4941.0.camel@chaos.site>
Sender: linux-kernel-owner@vger.kernel.org
To: Jean Delvare <jdelvare@suse.de>
Cc: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>, Andy Lutomirski <luto@kernel.org>, platform-driver-x86@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, stable <stable@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Jan 15, 2016 at 9:53 AM, Jean Delvare <jdelvare@suse.de> wrote:
> Hi Andy,
>
> Le Friday 15 January 2016 =C3=A0 08:27 -0800, Andy Lutomirski a =C3=A9=
crit :
>> FWIW, especially if we consider mapping it persistently, maybe we
>> should use ioremap_prot and map it both cached and ro.
>>
>> Actually, switching to a cached mapping regardless of persistence
>> could noticeably help boot times.  UC accesses are very, very slow.
>
> Sorry if it is obvious for everybody else, but what does "UC accesses=
"
> mean?
>

Sorry, I sometimes have my head buried too far in the CPU :)

UC means uncached.  ioremap, on x86, asks for an uncached mapping, so
every memory access (load or store) hits main memory individually.
Assuming that the spec says that whatever physical memory the DMI
tables live in is permitted to be used with cached accesses, asking
for the CPU cache to be permitted on those accesses will make them a
whole lot faster.

If that isn't safe, you could also just copy each table out of the
ioremap space into normal RAM as needed using MOVNTDQA.  I forget what
the helper for that is called, but it basically does a fast streaming
IO read and then writes to normal RAM, memcpy style.  Most modern CPUs
support it.

--Andy
