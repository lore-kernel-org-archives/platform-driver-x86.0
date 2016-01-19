From: Jean Delvare <jdelvare@suse.de>
Subject: Re: [PATCH] dell-wmi: Stop storing pointers to DMI tables
Date: Tue, 19 Jan 2016 10:12:01 +0100
Message-ID: <20160119101201.49c4d4c5@endymion.delvare>
References: <119170b95d373bc943eb4f16818239bac9fa6c59.1451832667.git.luto@kernel.org>
	<CALCETrVZ23t8u34VtgC+VVQC4PQ0JAw2u27+W_MQiwS=BgMAXQ@mail.gmail.com>
	<20160112142538.GB11560@pali>
	<CALCETrWUJ+5DowyLFDp7N_iNLsday4uKX3iO3NMC8Pfqma=O7w@mail.gmail.com>
	<20160115142719.36eea015@endymion.delvare>
	<CALCETrWXVxYLP0yTg4hS7JFjccjskvAF79ec6iSZsKJbLYi9GQ@mail.gmail.com>
	<1452880405.4941.0.camel@chaos.site>
	<CALCETrWsm1OVuZQNeU-UkcdNg1rt6Wu9CKY=xc_0M9kKzedYYg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:36148 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932641AbcASJMF (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 19 Jan 2016 04:12:05 -0500
In-Reply-To: <CALCETrWsm1OVuZQNeU-UkcdNg1rt6Wu9CKY=xc_0M9kKzedYYg@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Lutomirski <luto@kernel.org>
Cc: Pali =?UTF-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>, platform-driver-x86@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>

Hi Andy,

On Fri, 15 Jan 2016 12:00:02 -0800, Andy Lutomirski wrote:
> UC means uncached.  ioremap, on x86, asks for an uncached mapping, so
> every memory access (load or store) hits main memory individually.
> Assuming that the spec says that whatever physical memory the DMI
> tables live in is permitted to be used with cached accesses, asking
> for the CPU cache to be permitted on those accesses will make them a
> whole lot faster.
> 
> If that isn't safe, you could also just copy each table out of the
> ioremap space into normal RAM as needed using MOVNTDQA.  I forget what
> the helper for that is called, but it basically does a fast streaming
> IO read and then writes to normal RAM, memcpy style.  Most modern CPUs
> support it.

I have no idea what is allowed and what isn't, sorry. You would have to
check the SMBIOS specification but also the UEFI specification.

I have to admit I never understood why dmi_alloc is arch-specific nor
why dmi_remap is needed in the first place (and even less why
dmi_early_remap is different.) So I'm not going to mess up with that
code.

I have no idea how costly dmi_remap() is, but certainly it is being
called more and more as we can see dmi_walk() gaining in popularity. So
if anyone is worried about the performance, I'll be happy to review and
test patches.

-- 
Jean Delvare
SUSE L3 Support
