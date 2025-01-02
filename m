Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875705C96;
	Thu,  2 Jan 2025 19:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735845033; cv=none; b=Ze75MZIq5ukN1l3j46IW4/tUQET7jJTopUYzyPFXz2s+6d2iS0d6NgOewlz0Ar6m61lpFRtyQ3vMf8KvmZchIzaleXtrkqg1RVJ3s9ksMkWw8krhFI1GXn1y8iI+cD9AImX4Uw5soNLXrE8y/Iuzn21cxBEoZY7NpTujFuyVQrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735845033; c=relaxed/simple;
	bh=xu0CfipG9VNwsPWr3BCBmJNMpCdFTiWBWCz1oiyrv9s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c9PqheS/6r6xqVRoPMsdvkI9bnZE+X5iRDuGJO1r2zTTyzu8zseY3PORCGN2jAlcc0JaVThsnBfhS5kZ37vytIBz2IkHyc1NahQ0PUZ3rzDgxTA/kkCuIwi+z8fqQ+P3yTJ2my/d6orNK3DrudOstvXI0C3VsLPEkAWUF3EkSjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tzey2WqT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tzey2WqT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2603C4CED0;
	Thu,  2 Jan 2025 19:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735845033;
	bh=xu0CfipG9VNwsPWr3BCBmJNMpCdFTiWBWCz1oiyrv9s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Tzey2WqTtxkb40TfOr7+YyScQiWaWg1aUxMsKynPZmQ7mE/rbQEawgZZW2jWZ9Z8o
	 cuFF/3ALrqt0LqQCcOKIe2RtuBkHKEwiGnF3N/Kh4l88wEnD65XFacvcHMeKfxlovv
	 a5b7cpK2Wl2ULePNfb6v5kBJP/5tJIcTeohDfb0whi1jr9rO8e/AcBCWGju6NCKsFj
	 R0fr9LSIfjVHJFPEGQdszZdszfYsAwWwEW+9PxSRzxexvemzAc1pgTyuaanZprWbPw
	 P4J+vL57+MMNaF7TU5+sykDbaF8woItslNamVPafL07PNiK2UtXT6fDYg6gHEGsQJv
	 UwVyi59NqEQ3g==
Message-ID: <e588aeeb-e4f3-4780-be0b-ee2e9aa51f6e@kernel.org>
Date: Thu, 2 Jan 2025 13:10:28 -0600
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] platform/x86: Add Lenovo GameZone WMI Driver
To: Derek John Clark <derekjohn.clark@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, Luke Jones <luke@ljones.dev>,
 Xino Ni <nijs1@lenovo.com>, Zhixin Zhang <zhangzx36@lenovo.com>,
 Mia Shao <shaohz1@lenovo.com>, Mark Pearson <mpearson-lenovo@squebb.ca>,
 "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
 "Cody T . -H . Chiu" <codyit@gmail.com>, John Martens <johnfanv2@gmail.com>,
 platform-driver-x86@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250102004854.14874-1-derekjohn.clark@gmail.com>
 <20250102004854.14874-3-derekjohn.clark@gmail.com>
 <e738cf05-6fa6-4ca7-ba18-7f90bd316473@kernel.org>
 <CAFqHKTnnZYkT_RzdGFQ_HbCY-AzZF7CZhbAn-DyusgAEBDMpqA@mail.gmail.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <CAFqHKTnnZYkT_RzdGFQ_HbCY-AzZF7CZhbAn-DyusgAEBDMpqA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> 
> Simple fix. lenovo-wmi.c or lenovo-wmi-common.c is preferred?
> 

I think let's wait and see what the discussion on 0/4 lands on.  From 
your most recent comments I'm personally leaning it's best that 
"everything" is linked together as part of a single kernel object that 
happens to have a modalias that can let it auto-load from any one of the 
drivers.

That would mean you can put the helpers "between" drivers of that kernel 
object in a -common.c and use them as needed.  You can also avoid stuff 
like IS_REACHABLE because it all comes together as part of the kernel 
object.  You instead would just check if bound.

But let's see Armin's thoughts before you start moving things around.
