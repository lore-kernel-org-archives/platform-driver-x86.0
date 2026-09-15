Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00565363C59;
	Tue, 15 Sep 2026 14:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789481279; cv=none; b=VgLUqYgLzDu74Cl4BcBCXnfY6TaMVJwYEYXyI+w2KyRLYqZZDxU1hKB0LLtrDJ7oUvUMupsiTaqqU9EPNQd9cB8+2R8tjriu4Vr3wdDUxfW1JfHrq+wXJFnEUPGVwBoWLcD3rX8M1kP9tu+trQNLmnf0NoIDlG1G/qJp47UkulE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789481279; c=relaxed/simple;
	bh=11XC7wf5P6UWedewudfYlzEltmy2A2HCpUtrUfVI44o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AWiouZDYvyaBNKSyYyXWRGr+mBtpvvxpGND2SYGFkcXZ9YvcK/FQt6rEcAD1SdJcrP8NkthF/4gufdRDhz9aDm5lJggPMNLlb5TTTpLvMoMigvBziua5V5G80/OSuINWgZWOkfFN6708alItePQPff9lXwxMODmrQzp6g/FdjH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=XRQldClM; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="XRQldClM"
Received: from [10.235.78.2] (dynamic-176-002-017-114.176.2.pool.telefonica.de [176.2.17.114])
	(Authenticated sender: a.erhardt@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 712742FC0057;
	Tue, 15 Sep 2026 16:07:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1789481273;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sC8tfl7tvnZ3oMYuYH0zJsheUC/2cw32A1pysPrGc+4=;
	b=XRQldClMBDIDusvcQfk7M1l/GD5DMFEMxvihvzCRKMrO/W2p0tKi7CxUDMDwNfjB4m88ID
	D0FlnQpQM3MheLgVfdFEYsJzBZgMg6X782tHJF7tGZ6vNZqz7B6MogblXVsdF5JJgYVFvb
	opqkbV3o3Ii3k5rwnLagnTkjZna8yDo=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=a.erhardt@tuxedocomputers.com smtp.mailfrom=aer@tuxedocomputers.com
Message-ID: <7d7b5d84-e358-4745-8db1-69beb281c4d9@tuxedocomputers.com>
Date: Tue, 15 Sep 2026 16:07:53 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] platform/x86/tuxedo: Update and extend
 documentation
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: wse@tuxedocomputers.com, Hans de Goede <hansg@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org
References: <20260826081149.235487-1-aer@tuxedocomputers.com>
 <20260826081149.235487-6-aer@tuxedocomputers.com>
 <7533530b-1d13-e977-df13-f7ebf4e92a29@linux.intel.com>
Content-Language: en-US
From: Aaron Erhardt <aer@tuxedocomputers.com>
In-Reply-To: <7533530b-1d13-e977-df13-f7ebf4e92a29@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Am 15.09.26 um 15:08 schrieb Ilpo Järvinen:
> On Wed, 26 Aug 2026, Aaron Erhardt wrote:
> 
>> Remove an incorrect comment about the Microsoft MacroPad reference
>> implementation allegedly deviating from the spec and add more
>> information about the module and some other minor improvements.
> 
> Was it "incorrect" or was the spec clarified in a later version? If the 
> latter, that would be worth to mention instead of claiming the original 
> comment was "incorrect".
> 
> This is a honest question, I don't know the answer but I'm kind trying to 
> read in between lines here how we ended up in this situation so my 
> impression could be entirely wrong. ...Thus, please don't assume I know 
> much about the content of these specs (despite me briefly looking into 
> what I could find around this feature was introduced).
> 

The MacroPad reference implementation never deviated from the spec in this
area, at least not in the way the comment suggests. The comment removed here
references another comment, which is removed alongside the code that was
touched in patch 3/6 and assumed that intensities should allow multiple values
to be assigned (e.g. 256 levels), but that was never required in the spec. Even
version 1.4 (the initial driver had 1.5 as a basis) of the spec already
suggests using only two intensities for on and off while everything else is
done through the RGB channels unless the device has some sort of global
brightness control in its hardware.

I think the reason for this misconception might come from an actual bug in the
reference implementation (which is fixed now:
https://github.com/microsoft/RP2040MacropadHidSample/commit/cfc29120a3910c5772976da29ecd57392dfd44d6)
and the natural assumption, that intensity should, similar to the RGB channels,
have 8 bit. Therefore, the driver initially implemented brightness exactly that
way with 256 levels, scaling the RGB intensities with integer arithmetic. But 
since the hardware doesn't scale the brightness and the spec doesn't require
this, there is no good reason to do this.

