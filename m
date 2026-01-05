Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 029D6340DB2
	for <platform-driver-x86@vger.kernel.org>; Mon,  5 Jan 2026 13:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767620340; cv=none; b=RCHCVD3evg34/Hx65FKMqE/Jr444EaGcicng52A8peU5zHR86F/whOVAT1H+3zLgILp3rr5e35uLfMVA+XWoYAUMDzEJ+EeLlV0+jOQCqV6DHsxGfiYTM7KW7Dbd5OXFrBmxluBhoROxKJIrYo2bpabEXpBwtLTIhJ8a/Xj/CM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767620340; c=relaxed/simple;
	bh=DaehwTkILBy0lvSpZA2L8CcnA3tayVgPPgIH7uQ9Nik=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=qcn8hzT4QxpoUz5RVXzqUprVBf7LMSKiL6pWL7bK13TidFzSoqY6aeq9GiHtfeWdiJJFzDxAEUYC9ewQLQeqJik4e+8HdbHyZXbYjZzioMdHBeTYW9Yq6LDDu84o5cik09JML7N00qFy0IFtPD9Umw9NT30BSA93A9UCuUHxlzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=tGuXJla4; arc=none smtp.client-ip=95.215.58.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="tGuXJla4"
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1767620335;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9VBcF7jLhQbFtOVHzZtw8nYLDmL9TQxCrZlPawWNM6A=;
	b=tGuXJla4vCKC4s6+AktlIzgjvWQAbqcpQ57XnuZ6596HWt+bUbgpo6BGIoUUuqlMjKGLF1
	NfUux2n+7lzwBXfeuLDmxE8zFlLjeFOV3Xr78txTyriehjfDRY/ITgvmKqGS9ErnETJopM
	d3GON9ff6yRm0Po/aOh/vwEE1wdmqkM=
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.4\))
Subject: Re: [PATCH] platform/surface: Replace deprecated strcpy in
 surface_button_add
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
In-Reply-To: <4cadf166-2693-489e-a6f7-ae986694fd88@intel.com>
Date: Mon, 5 Jan 2026 14:38:22 +0100
Cc: Hans de Goede <hansg@kernel.org>,
 =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Maximilian Luz <luzmaximilian@gmail.com>,
 platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <BAED6C05-841E-4BEB-878F-6049D20669FE@linux.dev>
References: <20260105121802.1947-2-thorsten.blum@linux.dev>
 <4cadf166-2693-489e-a6f7-ae986694fd88@intel.com>
To: "Chen, Yu C" <yu.c.chen@intel.com>
X-Migadu-Flow: FLOW_OUT

On 5. Jan 2026, at 13:52, Chen, Yu C wrote:
>> -	strcpy(name, SURFACE_BUTTON_DEVICE_NAME);
>> +	strscpy(acpi_device_name(device), SURFACE_BUTTON_DEVICE_NAME);
> 
> Thanks for the fix, a minor question might be why we do not reuse
> name by strscpy(name, SURFACE_BUTTON_DEVICE_NAME) ?

Because 'name' is a 'char *' from which the size of the destination
buffer cannot be inferred by the 2-argument version of strscpy().

Using 'name' would force us to use strscpy() with 3 arguments:

strscpy(name, SURFACE_BUTTON_DEVICE_NAME, MAX_ACPI_DEVICE_NAME_LEN);

Thanks,
Thorsten

