Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC6E28DB3
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Sep 2025 11:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757502023; cv=none; b=f+sn6sQG1V8K0imrUjW9YLxa/7VKgvjwOpdrHSOh9TA5XnthlyDvZfsB3+B00IflBZ+X48JP4TZ/CRL5/y6kXUq5hxAZPbiE4qCwgxEgqNaSeiannARpi10toqMXx5qfAF8SU/sJRbrh4jON6U7makr6Ro210sW4RwL8DcrpI/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757502023; c=relaxed/simple;
	bh=RSnpf7NVhnZJDZHu6gOVt5GocPV/r2KoUAeNG9E6VL0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fsfszNVHXwEELark++Edpvk4/RwK3KyJmf/1iEj2/S6+GuXSg6CSDE5p5dYue1sMSeENQRZhqH4QsMSyiSmGcGee7jaBF5R0iF1aUvojuLUJnY1xGa4nN9K2JZqLzZCkUocuwKCUG7573LqzUHTw8Ehg+UrF4d1cMXF4wpxp+OA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QgRs48CJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QgRs48CJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B81EBC4CEF0;
	Wed, 10 Sep 2025 11:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757502021;
	bh=RSnpf7NVhnZJDZHu6gOVt5GocPV/r2KoUAeNG9E6VL0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QgRs48CJQghTwiWDTo0VVeC9B9zSxm5v31FzZy1ssrHCw/7+DkkRBLdujkJtfAx/W
	 XV5beBKzY/6WRHtvGxNphbCZ2u9MBhp9u4R5O4dD57IG2xLm5qtwYMEyYy866tPe6n
	 tnc+QFUgHgjSCgND4X0KiHNxeRvjm+CENxFnZxP15W6kpiX3DXbj9ElrLkes6f/PxI
	 pO1hfPULMfF01ULPaUBf1N7lKBVB5DkRphfiuTZHL3qbrivh48GoUkDnnaOm/MoLdf
	 yZbK80HxzmQNa/SAzNCRbGxBal82MQqdpvyM3jYS8vSpm+Q1MXZ2S4qODOyXfkK5AK
	 EJorOdCiDIU+w==
Message-ID: <0819c58d-cd35-44f3-b1b0-79a939ac6936@kernel.org>
Date: Wed, 10 Sep 2025 13:00:18 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] platform/x86: x86-android-tablets: Add support for
 Acer A1-840 tablet
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, platform-driver-x86@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>
References: <20250831105315.15349-1-hansg@kernel.org>
 <20250831105315.15349-2-hansg@kernel.org>
 <CAHp75VeJutOpvhh5-97RS73GMrJB5HyNggLtVjw9d3RM8Y_WEQ@mail.gmail.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <CAHp75VeJutOpvhh5-97RS73GMrJB5HyNggLtVjw9d3RM8Y_WEQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Andy,

On 1-Sep-25 11:13 AM, Andy Shevchenko wrote:
> On Sun, Aug 31, 2025 at 1:53 PM Hans de Goede <hansg@kernel.org> wrote:
>>
>> From: Hans de Goede <hdegoede@redhat.com>
>>
>> Add support for the Acer Iconia One 8 A1-840 (non FHD version) tablet.
>>
>> This tablet has the usual issues for tablets shipped with Android as
>> factory OS. The DSDT is broken in various ways, so i2c_clients for
>> various devices as well as the INT3496 platform-device for OTG extcon
>> handling need to be instantiated manually by x86-android-tablets.
>>
>> This table is special in that it is the first time a Bay Trail device
>> has been found to use the Dollar Cove TI PMIC and the first time that
>> the PMIC's Coulomb Counter is used as fuel-gauge.
>>
>> So far this PMIC has only been used together with Cherry Trail SoCs
>> and always in combination with a separate full-featured fuel-gauge IC.
> 
> Indeed, an interesting combination. Perhaps due to some cost savings on the BoM.
> 
> ...
> 
> Both patches LGTM, but I have a question. Do you plan to move to
> software nodes for the GPIOs, so Dmitry will have less work to convert
> them? If so, perhaps it should be a patch in the middle to convert the
> new file to use swnode, or the precursor that converts the whole
> driver beforehand. What do you think?

Good point.

Lets delay this series till after Dmitry's software-node GPIO changes
have been tested (by me, hopefully soon) and landed and then I'll
rebase this on top and also use swnodes here.

Regards,

Hans


