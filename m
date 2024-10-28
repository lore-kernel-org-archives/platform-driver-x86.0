Received: from juniper.fatooh.org (juniper.fatooh.org [173.255.221.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32B61534E9
	for <platform-driver-x86@vger.kernel.org>; Mon, 28 Oct 2024 18:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.255.221.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730138610; cv=none; b=PUPEYuviA5QHMmde0ynQS9icKpGvL5jZ1Wz8EG72mAIxQPWAzWbdQpq3bD/X3OwLu+ssYTbvSet1iF28/xIK6P80pofIJGxVBMH/ELK8o4OY2o54u+ZSZaIVvxfbZTNIL7bg31BKM4ikUNn7CWRipRdCZLCX+AgR1+3RKGvSb0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730138610; c=relaxed/simple;
	bh=qkBHB8hsVSOnnXjKGJ7Cag7ZRyA1UHwdBf0JJTXOZbY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=l3nMRqAhA7Nrcltb+lujVebnojl9SpdjhWKpUrrG4yXS1Ziy19yHaknXiepJpW6y80784ZFaxvfkKI+SDEIVnxx7Z3C2g6j0ewDkfhNTxx1b/k17cbihPD0K/ouD1BmVptBxBcp3mBk7c1ALWgSwU+OyVoc58XZlRBfztku2BFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fatooh.org; spf=pass smtp.mailfrom=fatooh.org; dkim=pass (1024-bit key) header.d=fatooh.org header.i=@fatooh.org header.b=am2XLbBp; arc=none smtp.client-ip=173.255.221.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fatooh.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fatooh.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fatooh.org header.i=@fatooh.org header.b="am2XLbBp"
Received: from juniper.fatooh.org (juniper.fatooh.org [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by juniper.fatooh.org (Postfix) with ESMTPS id 5AD7A401F6;
	Mon, 28 Oct 2024 11:03:26 -0700 (PDT)
Received: from juniper.fatooh.org (juniper.fatooh.org [127.0.0.1])
	by juniper.fatooh.org (Postfix) with ESMTP id 42887403F3;
	Mon, 28 Oct 2024 11:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=simple; d=fatooh.org; h=message-id
	:date:mime-version:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding; s=dkim; bh=lMbGcy6oWRnc
	LTLDiqk35qZ00XQ=; b=am2XLbBp9CsqAxakOsLy2/4LJ7nmbhspj+F1dT1Nz70P
	y6j6ON6XBb/+/Pa0v3DEVbGNOGXj4Jffa0G3j7VBIJU/JtTTmHHlZ1dgSXi/102D
	i/rk04mRzpMOFO3Ssr/70MHe9yNphKhbswnlKG6bA0OyZJr42I7wvNoSCJhDlpw=
DomainKey-Signature: a=rsa-sha1; c=simple; d=fatooh.org; h=message-id
	:date:mime-version:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding; q=dns; s=dkim; b=DhvF7u
	fDj8giQjOzpQmdxltAOWb3zvAe8/2glvyEVeTCiS6ZfAD7haMJrZdcdztSx9ILAz
	ha+URPYLX4YczukrYWEZNJ+LGwYbG77XZHo6steonLNyDHOqZoszXpMOqaus0Xvh
	Qv3UCmksjWqZlkkV/p1+jwtWQzTkrVWnP52S0=
Received: from [198.18.0.3] (unknown [104.184.153.121])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by juniper.fatooh.org (Postfix) with ESMTPSA id 35202401F6;
	Mon, 28 Oct 2024 11:03:26 -0700 (PDT)
Message-ID: <6feb18e0-04d5-44b5-aa75-5b3100d5a851@fatooh.org>
Date: Mon, 28 Oct 2024 11:03:25 -0700
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] platform/x86/amd/pmc: Detect when STB is not available
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 platform-driver-x86@vger.kernel.org,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20241025051141.924760-1-bugfood-ml@fatooh.org>
 <20241027023428.419116-1-bugfood-ml@fatooh.org>
 <cc52d127-794e-439c-be6d-e6e7bc6fad61@amd.com>
From: Corey Hickey <bugfood-ml@fatooh.org>
Content-Language: en-US
In-Reply-To: <cc52d127-794e-439c-be6d-e6e7bc6fad61@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2024-10-27 20:55, Shyam Sundar S K wrote:
> No need to put my name in the commit message.
> 
> You may simply the commit message to something like this:
> 
> Further debugging reveals that this occurs when the requests for
> S2D_PHYS_ADDR_LOW and S2D_PHYS_ADDR_HIGH return a value of 0,
> indicating that the STB is inaccessible. To prevent the ioremap
> warning and provide clarity to the user, handle the invalid address
> and display an error message.
> 
> With this addressed
> 
> Acked-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

Ok, thank you. I have made these changes now as patch v3.

-Corey
