Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6F528CF4A;
	Wed, 11 Mar 2026 04:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773205085; cv=none; b=qHbLvruA26dDDlNOwJBdv6EBtzi3PaUyzVMfaTL0caHwjJJvgNGhaosszUWqMBWKpDREZJfKjLQslG7kpyt8gOS/ZwyZBl/evK4qy0tyWxnC3kCRnnIy0+E14SDSxpuTzelXQ43KqbOgwVhRshr0GPjF+pWr0BX2cxR7MU1rUZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773205085; c=relaxed/simple;
	bh=PPh4p9TMc+yxFwkeztcG783ewgHhUQ6b37NDTTtBG3w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hdMUJjYPI6g+lXmNgrsGA94tPsvSUVql7ro9F8sNoQtql3TwPb1U2L2bzqo0ko9eOoccl+zPvKrv9e8Wqqwaxevqs7X6fh/rkxxE/jgqh0sH5N6khAf0feu0nAXcPgFz4W4vFvZ01EpBBU8EzkPiRYgfesonrXt4tTXe2sjAL+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=hjIHq9OY; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="hjIHq9OY"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=x4A282qbKiRaDxLxOFzUvZJlDLVzn+npN+jW3VDUXrE=; b=hjIHq9OYwLwYJpDalYhfPrzXgC
	fyNofX/OBHVH67n+dAMxVVn9PSIktXrzt5b/om/maLaVIeM91UDTTAlKnlmns16dGM7ZAKe8GE3TL
	uuKGUdja0Acc5n1UqeBzA2AANOZKsavxSPT48jll7+0DmNvkH8y5dqv8ejOUbAmbZTB9IxDs9mxIS
	bouzsfyj0jym4IjMr8wMFzD6+UQMlDTOsf0IWXN/ZJftizUSkHSPgHEyUCakHGsVounLWaB9+9usX
	VtTfJ8SgYcYHN3iTJspdMI7xt2+RfUPGnLDEv6rkXLoWGZo7jlp3VwSD5bxwrZcr5XotG8y/P1/24
	KZLRLynQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Bdm-0000000Ak0P-2oiL;
	Wed, 11 Mar 2026 04:57:50 +0000
Message-ID: <363b80db-9bf3-44d5-a756-e64d29bd36ec@infradead.org>
Date: Tue, 10 Mar 2026 21:57:50 -0700
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/5] Documentation: laptops: Update documentation for
 uniwill laptops
To: Werner Sembach <wse@tuxedocomputers.com>, W_Armin@gmx.de,
 hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20260310234022.2085232-1-wse@tuxedocomputers.com>
 <20260310234022.2085232-6-wse@tuxedocomputers.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260310234022.2085232-6-wse@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Werner,

On 3/10/26 4:34 PM, Werner Sembach wrote:
> Adds short description for two new sysfs entries, ctgp_offset and
> usb_c_power_priority, to the documentation of uniwill laptops.
> 
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
> ---
>  .../ABI/testing/sysfs-driver-uniwill-laptop   | 25 +++++++++++++++++++
>  .../admin-guide/laptops/uniwill-laptop.rst    | 12 +++++++++
>  2 files changed, 37 insertions(+)
> 


Can you give me a lore.kernel.org URL or a message-ID in which
I replied with a "Reviewed-by:" tag for this patch, please?
I don't recall doing so, but I could have.

thanks.
-- 
~Randy

