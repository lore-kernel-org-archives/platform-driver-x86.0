Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BDCF52F99
	for <platform-driver-x86@vger.kernel.org>; Wed, 24 Sep 2025 01:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758675948; cv=none; b=G2veFzuHN+GvN0A1CiJDx+mZKAWtvFentBaPtQ55STm03cdlWI4P8m9sOMfakoZ98vsp/+xotuxEhBbI8fhkMvTNLKpMd2qDNZJphh8IAA8GirhI7kpCJKOGeyM1sX92wHWDgTLwT20540WFpNW2xdyMeKDbgqPqwm301aU8uzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758675948; c=relaxed/simple;
	bh=8jo18O7xt7bHr8Ver3XpX1CPraH2nNHY4R2C961OQT0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zt6SWLLuTT2AQ/aIdTQaRKwqVAvift8xyyxBa2ZAUBKV1J3SynFuE1SAdKkT+g2velRaKRXGnJSvlToQYdoLlGFcQCUHDKTMjG/999R7I/pCKBrPBSbDDSgaJ8+DNmvx45BhGw6Xhr6Q6ofInJxrLdwqAMrv0xs4qSyq19zpSqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=AWg48Wgc; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="AWg48Wgc"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=qsfXDlnot4oObBTUBaEOZ8UcN2V5wpkgLA0QfcIffJ8=; b=AWg48Wgc05XSJLMJxIrMMd9Cgy
	sZgqE9CiIGCoIi5QZtwqKpufKxT648o/RAfFZOs5Fvrka26IMcD9pL7TRlz7nPgdHnZ5VdghjOcMB
	9p7Y/MDswCE5nl8NakHniVF0KzRv0rahARZwmnIG4JAVxB13jTBG0Rle8OPgqRi+bKTQn8Zh5ySbp
	ZM2kXlPfjmpjKnlm5nXPJp2+GZS1CiKu7Iu6Ta0KaiNCjrlwA6Lokial1T3VxSa1ZEPBF+arPyg9u
	1uk4eirATJ3L11z7CUqvkM0U1Al4uYRRtEyFOj0zWqrpkYsrgs+z+dOTtfyhfH2gkRMdYeqJwbvwb
	ouijEd1w==;
Received: from 201-27-133-184.dsl.telesp.net.br ([201.27.133.184] helo=[192.168.1.60])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1v1Dwp-00GWO7-Py; Wed, 24 Sep 2025 03:05:32 +0200
Message-ID: <081cc0a2-f684-e5aa-e87f-05a54db87022@igalia.com>
Date: Tue, 23 Sep 2025 22:05:23 -0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 2/4] platform/x86/intel/pmc: Dump raw SLP_Sx_DBG registers
 and distinguish between them
Content-Language: en-US
To: =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, irenic.rajneesh@gmail.com,
 david.e.box@intel.com, xi.pardee@linux.intel.com, kernel-dev@igalia.com,
 kernel@gpiccoli.net
References: <20250922230812.1584253-1-gpiccoli@igalia.com>
 <20250922230812.1584253-3-gpiccoli@igalia.com>
 <db836cd7-c3aa-ee60-e622-c52fcdb78fb3@linux.intel.com>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <db836cd7-c3aa-ee60-e622-c52fcdb78fb3@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Ilpo, thanks a lot for your review, very nice points! Comments below:


On 23/09/2025 04:59, Ilpo Järvinen wrote:
> [...]
>> This should bring no functional change, the goal is only to improve
>> reading and allow full comparison between raw register values.
> 
> Hi,
> 
> I don't think that's exactly the definition of "no function change" if you 
> intentionally make a change to the reading. :-)
>

Hehe yeah, you're right - it changes the output, so that's a functional
change indeed (imagine a userspace script parsing it...). I was thinking
in functional change as in "no extra register reads are performed", but
I agree with you and will drop this text from next version, thanks for
pointing!


>[...]
>> +
>> +		if (dev)
>> +			dev_info(dev, "\nSLP_S%u_DBG:\t0x%x\n", cnt, data);
>> +		if (s)
>> +			seq_printf(s, "\nSLP_S%u_DBG:\t0x%x\n", cnt, data);
>>  		while (map->name) {
>>  			if (dev)
>> -				dev_info(dev, "SLP_S0_DBG: %-32s\tState: %s\n",
>> -					map->name,
>> +				dev_info(dev, "SLP_S%u_DBG: %-32s\tState: %s\n",
> 
> I'm not sure about this change. To me it looks the naming is "SLP S0 DEBUG 
> REGx (SLP_S0_DBG_x)" according to this:
> 
> https://edc.intel.com/content/www/tw/zh/design/publications/14th-generation-core-processors-ioe-p-registers/slp-s0-debug-reg2-slp-s0-dbg-2-offset-10bc/
> 
> ...So changing from S0 to S1 or S2 does not seem correct here?
> 
> I wonder if this really a problem to begin with as the names should be 
> unique, no?

Totally right again! Nice catch, it should be as you pointed, the
different ID is at the end of the string.
And no, it's definitely not a problem / big deal - I just took the
opportunity to improve the output, but I messed up heh

Lemme know if you prefer that I keep the old naming or fix it properly,
like SLP_S0_DBG_2, etc.


> [...]
> This assumption seems somewhat fragile but maybe it's not worth 
> engineering it beyond this at this point.

Sorry, I couldn't understand this sentence. Can you clarify it for me?
What assumption and what do you think we should do?


>[...] 
> Also, please remember to add all maintainers as receipients when posting.

My apologies - I checked MAINTAINERS directly and added everyone from
INTEL PMC + Xi Pardee (many patches in the driver); but I should have
used get_maintainers instead, which brings your name. Thanks for
reviewing even when I forgot to add your email!!
Cheers,


Guilherme
