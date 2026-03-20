Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178983D171F;
	Fri, 20 Mar 2026 17:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774026870; cv=none; b=JES0AxmQAvSBylIJ35zT2nTqVMxf3C68RRslnM3LHubxhjg7j0Hd82QmVTGKS6Kt4Tuy1NLrQ/arCxXwZIbALN33/H5IjU09k0W/bftzywY7oKecIb0g30A/GeAM/S0Y07fEBthFKcGtId+w87TQl8vqwCVVhJpYbEIvPtQgBL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774026870; c=relaxed/simple;
	bh=SjlTtzHfQg7fslRvNnVnyvvQg6LNUISEHnx8kY05ER8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jZsvzA2cxZoE2BNjuEp4az2Eu2g1MLDU4FkxhAPIoXJzW/I7xhj0hvz1s79WHPljvETo8qy7+anyaD4NRl9UuNC7wimlF5efZ1rLEEWpTyQD1h7u0hhUF5uiYqglj5TPCd3g4R8rj+M43FVAUgojmC2Fqy+kdzcP3tESngJYDJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=K5WK+3MW; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="K5WK+3MW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1774026866; x=1774631666; i=w_armin@gmx.de;
	bh=dA12zum7alK2PbdNAPidzVzbT6ciB1sEPRyM5jo3LwM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=K5WK+3MW+aOXKSxT0ShA4lDRM8f48BPO+q7br6KyEO+9R9nchQRpGCaHvE9XJbQ9
	 G/ICQZuVrfRqA0Qf2f2N9IE0U1jBb8938+uS1tzIOJ4w09EMx/9jZvz6LY8x+1dR5
	 2u4+WyJ3VoDXEw2IiPv96s4JQMETOwrifX4+z97QXlCAEHR3xD76iwP3jL1mtigBp
	 rBnG+QNKTtZf1bBuLRy+jwl3puyAJr4gwu+1QXwry5uhy49x0LNXyjP1r0VDhUabc
	 j9NsBBULj7efeuiEm0hp7CbclMAaXy7mG6pl+cQ7RLhbe9OJmhR6KTgVjWQVOLn1r
	 BgCnHbabuU08Rut79A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MysW2-1vi8Yq0xes-010DIZ; Fri, 20
 Mar 2026 18:14:26 +0100
Message-ID: <5f8ade5a-31fa-41a9-b5b8-7f3af00e4a6d@gmx.de>
Date: Fri, 20 Mar 2026 18:14:25 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/5] platform/x86: uniwill-laptop: More support for
 TUXEDO devices
To: Werner Sembach <wse@tuxedocomputers.com>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260312192705.76576-1-wse@tuxedocomputers.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20260312192705.76576-1-wse@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:WG0sxBO9DBnvSzhtBaRS9E0h34+tOZY9iC7g8ZZNp2ArOAUlJkW
 M/BWlI9qiN+sQLiS6ctnewIj1rM0pWfbhD0NMK/Zvu8/itxElWABsy5UeGcHENK3Kxg5rbt
 wuz8oMCJsjDkCbiF2L1bpd6o6REeW15heeTEI2eqT0w54X+ER1OLiiBJOPx0qW1MNguLMud
 95UZA7xBc+DTlAXhirCjw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:STpK+bWG/5Q=;vAnC2rzQa+7v7sWtxF7oe4Y7nb+
 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

Am 12.03.26 um 20:25 schrieb Werner Sembach:

> Sorry for sending a secound time, messed up subject line (still had v5
> instead of v6).

Any thoughts on this series? I have tested it on my device as well, and everything
seems to work fine.

Thanks,
Armin Wolf

>
> v2: Incorporate Armins feedback.
> v3: Incorporate more of Armins feedback.
>      Rework USB-C power prio functions
> v4: Readd system vendor SchenkerTechnologiesGmbH for XMG FUSION (L19)
>      Replace for loops with if statements for USB-C power priority functions
>      Add missing mutex in usb_c_power_priority_restore
> v5: Restructure patch around new entry for XMG Fusion
>      Add missing Reviewed-by and Tested-by
>      Spelling fixes in documentation
> v6: Fix small format error in docs
>      Fix Reviewed-by line
>
> Armin Wolf (1):
>    platform/x86: uniwill-laptop: Rework hwmon feature defines
>
> Werner Sembach (4):
>    platform/x86: uniwill-laptop: Implement USB-C power priority setting
>    platform/x86: uniwill-laptop: Fix XMG Fusion 15 (L19) entries
>    platform/x86: uniwill-laptop: Apply features across all TUXEDO devices
>    Documentation: laptops: Update documentation for uniwill laptops
>
>   .../ABI/testing/sysfs-driver-uniwill-laptop   |  25 +
>   .../admin-guide/laptops/uniwill-laptop.rst    |  12 +
>   drivers/platform/x86/uniwill/uniwill-acpi.c   | 439 +++++++++++++++---
>   3 files changed, 406 insertions(+), 70 deletions(-)
>
>
> base-commit: 1f318b96cc84d7c2ab792fcc0bfd42a7ca890681
