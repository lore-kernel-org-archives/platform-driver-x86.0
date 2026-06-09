Received: from out30-99.freemail.mail.aliyun.com (out30-99.freemail.mail.aliyun.com [115.124.30.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82883AFD0F;
	Tue,  9 Jun 2026 11:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781003669; cv=none; b=cuqQ/48RMTx+jShLyxFA9tlSBDE/0aZUF1orsyp9cWeWeY+jFKtohxX/ingsKOKi8GEFQ4y636y+4k8mLyQxkcFt300Br9Ibi9CAHcH1R9ag5Tkvm+h9tOj+Cl3VD14RouRmQo9uPKW/yOYFRtUSIu5yB6qKTRX5REoNqRbASv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781003669; c=relaxed/simple;
	bh=N/kd0VqWtiq87UwwM8v0Xg+w3/bcLMbLMzg+9H8U50E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bNNqxiNypTXbOx3q2eWIQtL1e0w4+rhF3X1JoUyJKtTgep1CPaOfhJY1CLwJTkP25gJJptsIgntK20qIYq4q17IFKQrVN+U1R0oUNELxkshllkPom9r6LZaCj2NAA0CPijcgRIA06IHWRnPr2b1JuzeyQrNfd3YxRkBMPASk6lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=OboXIEy4; arc=none smtp.client-ip=115.124.30.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="OboXIEy4"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1781003663; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=swx5gW5znpDw15j5Nsxq7agsdItG7sou2ENZXDEV3DE=;
	b=OboXIEy4Idp5ci+dNQxnE8grqY98ZWOGCW//JmKpc6lMWikBsQu32N/HMyM0qG6m+lso16c+3T3h0LAY2RFUyeapf8/BX+YUWzKGWdbXmt3ySOLB+sxchLrV9VxJxP+AQshCufcu0OBg4L+I25S6EnNnGExlJduufTWz+N3EuZY=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R711e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=qinyuntan@linux.alibaba.com;NM=1;PH=DS;RN=9;SR=0;TI=SMTPD_---0X4WIdrm_1781003587;
Received: from 30.178.83.182(mailfrom:qinyuntan@linux.alibaba.com fp:SMTPD_---0X4WIdrm_1781003587 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 09 Jun 2026 19:14:22 +0800
Message-ID: <928555af-cbb2-47fc-a224-8605d7a050b8@linux.alibaba.com>
Date: Tue, 9 Jun 2026 19:14:22 +0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: =?UTF-8?B?TW96aWxsYSBUaHVuZGVyYmlyZCDmtYvor5XniYg=?=
Subject: Re: [RFC PATCH 1/8] platform/x86/amd/hsmp: Add new HSMP messages for
 Family 1Ah, Model 50h-5Fh
To: "M K, Muralidhara" <muralimk@amd.com>,
 Muralidhara M K <muralidhara.mk@amd.com>
Cc: Suma Hegde <suma.hegde@amd.com>,
 Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>,
 Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260528093954.2461272-1-muralidhara.mk@amd.com>
 <20260528093954.2461272-2-muralidhara.mk@amd.com>
 <20260609081456.1152820-1-qinyuntan@linux.alibaba.com>
 <e9f8da40-359d-40f4-9746-b711d1127f31@amd.com>
From: qinyuntan <qinyuntan@linux.alibaba.com>
In-Reply-To: <e9f8da40-359d-40f4-9746-b711d1127f31@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 6/9/26 6:06 PM, M K, Muralidhara wrote:
> 
> This command is not supported on the Venice platform (Family 1A Models 
> 50h-5Fh). Please Refer https://docs.amd.com/v/u/en- 
> US/58264_B0_Venice_PPR_026
> The modifications need to be made in the esmi_ib_library, not in this 
> patch.

Hi, Muralidhara:

Thank you for the prompt clarification and the PPR reference. That
makes sense — the kernel descriptor for 0x26 is correct as-is.

Thanks again,
Qinyun
