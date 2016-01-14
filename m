From: Jean Delvare <jdelvare@suse.de>
Subject: Re: [PATCH] dell-wmi: Stop storing pointers to DMI tables
Date: Thu, 14 Jan 2016 21:16:12 +0100
Message-ID: <20160114211612.5c253e32@endymion.delvare>
References: <119170b95d373bc943eb4f16818239bac9fa6c59.1451832667.git.luto@kernel.org>
	<CALCETrVZ23t8u34VtgC+VVQC4PQ0JAw2u27+W_MQiwS=BgMAXQ@mail.gmail.com>
	<20160112142538.GB11560@pali>
	<CALCETrWUJ+5DowyLFDp7N_iNLsday4uKX3iO3NMC8Pfqma=O7w@mail.gmail.com>
	<20160114140731.0b324e92@lxorguk.ukuu.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:50198 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753649AbcANUQQ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 14 Jan 2016 15:16:16 -0500
In-Reply-To: <20160114140731.0b324e92@lxorguk.ukuu.org.uk>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>
Cc: Andy Lutomirski <luto@amacapital.net>, Pali =?UTF-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>, Jean Delvare <jdelvare@suse.com>, Andy Lutomirski <luto@kernel.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Alan,

On Thu, 14 Jan 2016 14:07:31 +0000, One Thousand Gnomes wrote:
> > Jean, am I right that drivers must not store pointers to DMI tables
> > that they find through dmi_walk?  Is there any alternative interface
> > that could be used to get a longer-lived pointer to DMI tables, or
> > should drivers just parse them and copy out any info needed from the
> > dmi_walk callback?
> 
> The easiest long term solution might be to just map the dmi buffer once
> and keep it. It's not that huge so it's not a big address space hog.

Please note that SMBIOS specification version 3.0 allows for 32-bit
length for DMI tables, suggesting that 64k tables were not large enough
for everyone.

Just saying. I have no strong opinion on the matter.

-- 
Jean Delvare
SUSE L3 Support
