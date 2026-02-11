Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86A01B983F;
	Wed, 11 Feb 2026 12:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770813147; cv=none; b=fzZMwnknof/7oB3IvfFqzMzZ8/SronsUg48tpQ76SFoxT+EI/QUPcokPu+53xbNEJ9FS3TkaAiqSwLuPK6r68ukWEsgrN2MQTigIgj3u83czImtjvMyfWlxElQixL6D1zC+/NV5eTH4yB9J+3P4Rn+ZqzVfwecyQNFD0j5OwXm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770813147; c=relaxed/simple;
	bh=SR6L6pmtJNUesOb51U8AVeso9s4aAcy87BgeKosyGig=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i8EWOcKpznmhqaY3nyi5BiTtOXR9chzf/dBwur+hPmWiN7wmCjS3t71RiPfAG41FJcrCEhtdIjE54mvBURaDkteCnsfJNtSfQq4Z0fKZgUGQ6Co5HG/8ij/b3DbUcbI17C20f8IzeCV0AJUtYD+7CVkod7Ve/lz2XocLBpZNtLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FGAW7CA9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FGAW7CA9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5BEAC4CEF7;
	Wed, 11 Feb 2026 12:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770813147;
	bh=SR6L6pmtJNUesOb51U8AVeso9s4aAcy87BgeKosyGig=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FGAW7CA9cgstLg+5T7zmWtTtPcmlEAVnlvCu9MTnLJ92o5CuHfUlZ7jRgSiHf6upX
	 zWIqQAZXwKJobIx1HAUnkET/rGwcoWJnJDkVi9MD12ZCbOslYSOa4ZfUsRo7tPFgeb
	 imQkmyNfzb16gjj+0SSPZvZVaTo9D2fOmqyP2L4rm3cWpjLK5+EvEVHyRMaP3sMMIj
	 4CnSdd1TodXfUidq0C6GuW8O1I7YNwnBoIrbJ/byTtmbfkyydH4Rp28+/5WFlYk9Ow
	 jHd20kBnVFhmWT8s7/LxjTwQ4BBKhAxuuVRSNge6vqRRlPHJdw6BdkMi8tTG5AHsSV
	 at3XGvfEzL8nA==
Message-ID: <4ba400f8-34a1-4f00-a500-2775a09391b4@kernel.org>
Date: Wed, 11 Feb 2026 13:32:25 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] apple-gmux: preserve brightness using EFI
To: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
Cc: ilpo.jarvinen@linux.intel.com, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org
References: <44e9e403-55f6-4601-9ba5-991619d09d88@kernel.org>
 <20260211123018.4910-1-atharvatiwarilinuxdev@gmail.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260211123018.4910-1-atharvatiwarilinuxdev@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 11-Feb-26 13:30, Atharva Tiwari wrote:
>> I think this is missing efivar_lock() + unlock() calls ?
> 
> actually, efivar_set_variable already holds the lock, so efivar_lock isint
> required.
> 
> See: drivers/firmware/efi/vars.c:242 and drivers/firmware/efi/vars.c:184

Ah I did not know that, that is somewhat inconsistent but not
a problem with this patch:

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans




