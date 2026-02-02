Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BFD231987D;
	Mon,  2 Feb 2026 08:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770019978; cv=none; b=S/vIm4Yq/OEOPHrkN1duQzolIcodeXIwWv65ENgcUw1vgIzxfisuulCQ+BST4hCcKVRwLhuPISAh/NZkuLDHGSgvLS2avAFkctZ3ubuAo0gyTEa/NLWk01M2meb6Droxk8kDyYPCAYD2/CVnknoZk74yFCVwHRwMmKIXfCYvaXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770019978; c=relaxed/simple;
	bh=J/miz9G6KPWFyQRqmLFXDkSic/bk7y5/czUygFiENIk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e6eI0v3/EsV2fcuqnPzuw7k0Wx0qiBU5SyWalctpdaKC/HZ4B0XoUVqa8HjAN6nWLSfPCQIMIZimjj7E/6mDjej4Zi2FBhLK63lfjDSqYN4+dBIqNUj3fYky4736LHefV5CvrtsJKWbZxxB1kAlvt8H7l+txPShk9aN3vSpHdu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eRdmQxdJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eRdmQxdJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65B9CC116C6;
	Mon,  2 Feb 2026 08:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770019977;
	bh=J/miz9G6KPWFyQRqmLFXDkSic/bk7y5/czUygFiENIk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eRdmQxdJc2MmzDFX/MXy2ZJ6ojBjmPYQ5ezExca6TdDsEMmMq+cmpCusG9ZA01WzA
	 oq09GHl2+8mUXuJvbVqK8AkfaQlwHAy1MtccpzoBd0s2J8YA2lsP83OetgHv0rAWl1
	 DZTf+/42WRjfXE9Rqzojd6WS5tkvznmMEnZLrj8IAiMI52Y+eG0ld60WF7nQIlqPqf
	 lTTok9o9ekiaFAWHe5u0ul3wlahbaf63LLrirhNTYB+R59ixoaqokgL7B56bOTwI2M
	 dHV9+nMBBJhyfglYnLM+IkKhHubTIrRJiudtsq/0H6v1UryfI+AAq+G62h1m0lg2ku
	 vukPevXB4x3Ow==
Received: by pali.im (Postfix)
	id E098148F; Mon,  2 Feb 2026 09:12:47 +0100 (CET)
Date: Mon, 2 Feb 2026 09:12:47 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Kurt Borja <kuurtb@gmail.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Hans de Goede <hansg@kernel.org>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Olexa Bilaniuk <obilaniu@gmail.com>
Subject: Re: [PATCH] platform/x86: dell-wmi: Add audio/mic mute key codes
Message-ID: <20260202081247.vpvbsapdrynr7vtf@pali>
References: <20260201-mute-keys-v1-1-825e786732fc@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260201-mute-keys-v1-1-825e786732fc@gmail.com>
User-Agent: NeoMutt/20180716

On Sunday 01 February 2026 23:37:37 Kurt Borja wrote:
> Add audio/mic mute key codes found in some Alienware devices.
> 
> Cc: stable@vger.kernel.org
> Tested-by: Olexa Bilaniuk <obilaniu@gmail.com>
> Suggested-by: Olexa Bilaniuk <obilaniu@gmail.com>
> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> ---
>  drivers/platform/x86/dell/dell-wmi-base.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/platform/x86/dell/dell-wmi-base.c b/drivers/platform/x86/dell/dell-wmi-base.c
> index 28076929d6af..62cf28d1fe19 100644
> --- a/drivers/platform/x86/dell/dell-wmi-base.c
> +++ b/drivers/platform/x86/dell/dell-wmi-base.c
> @@ -86,6 +86,9 @@ static const struct key_entry dell_wmi_keymap_type_0000[] = {
>  	/* Meta key unlock */
>  	{ KE_IGNORE, 0xe001, { KEY_RIGHTMETA } },
>  
> +	{ KE_KEY,    0x0109, { KEY_MUTE } },
> +	{ KE_KEY,    0x0150, { KEY_MICMUTE } },

Hello, please keep codes in the array sorted.

> +
>  	/* Key code is followed by brightness level */
>  	{ KE_KEY,    0xe005, { KEY_BRIGHTNESSDOWN } },
>  	{ KE_KEY,    0xe006, { KEY_BRIGHTNESSUP } },
> 
> ---
> base-commit: 008bec8ffe6e7746588d1e12c5b3865fa478fc91
> change-id: 20260126-mute-keys-7f8a27cd317f
> 
> -- 
>  ~ Kurt
> 
