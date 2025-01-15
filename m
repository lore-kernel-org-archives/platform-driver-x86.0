Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BBC54644E;
	Wed, 15 Jan 2025 14:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736951873; cv=none; b=tIPKxTu/DPfzWWrYvS7LI+DvA8Y54vFJC3i0epyhUl37ZRa3LDXl60Sepjp74luQwlwLhekHZZUyG30iPc3/ghgv7D9iBRYsgJBXL7ZPnkeqpXh4ihKVPaRywwZb0WSoeYa8skroBzlVTX5DRWr8+Zy6uDzKY0vi1X9Eh8CHjrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736951873; c=relaxed/simple;
	bh=vynWK5akYQ4pywslAmhY1412cyV4vnQgS6yIG8OJUgo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=CGxhBP8Mo/bgb1qKQF0gE3ziTe7e7OmQaSZ53fvU9pLTDufBYFjwDO/fDczRG0m2u6Mko4+PTdnEYZ9gbSlVjeObV6Tu3swu70nAu5HFs20013lSMQtWsp6jnAZesJ3pgEPdW9QSC+s9kYys+Fb2kU4LoPA1QBeqIBC5d9s91+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DKcJT6Ez; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DKcJT6Ez"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736951871; x=1768487871;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=vynWK5akYQ4pywslAmhY1412cyV4vnQgS6yIG8OJUgo=;
  b=DKcJT6EzA3hpiQXEuqWC2K9OpnmaeMvbbEBmblH9GihbeYr0JODTZJ/L
   ZZXWAoQyRYa1M/Y10x8D2DttuF7Uii2Zv7mka0qXF5Cyal3NXl29Sgo6s
   nSw5Fn8ES9A2qDIhB8niL5H0Qp+A3HK5LIMKp8Oe5+ceUqmljeYaqpqJK
   BYi9ovhs8+VdQIADptuJrqLsqQw7fRJQlFDeERfPFBBTqwKcvpwnnL+x3
   mS68AMmCHmsJIIMQLHpdN/R8ZcYj7baMjV0t1HlsI6YI+wyv9WBeGcYhe
   tPDefh1ZGY5lmTp9b4BBflkAgWmtTdkQYC7Xv+08g38AeM8X62qZ7D/8e
   g==;
X-CSE-ConnectionGUID: qgaJtwPQRbaWh+ycHnYNaA==
X-CSE-MsgGUID: HTrAgIQISV6i3Nfy7RyS6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="62661717"
X-IronPort-AV: E=Sophos;i="6.13,206,1732608000"; 
   d="scan'208";a="62661717"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2025 06:37:50 -0800
X-CSE-ConnectionGUID: TIVW1CcySo6NtcdELRPQ9A==
X-CSE-MsgGUID: Yx5ybwDtSYquvPuLOEQVCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="128432061"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.214])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2025 06:37:48 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>, Armin Wolf <W_Armin@gmx.de>, 
 Kurt Borja <kuurtb@gmail.com>, Hridesh MG <hridesh699@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250113-platform_profile-v4-0-23be0dff19f1@gmail.com>
References: <20250113-platform_profile-v4-0-23be0dff19f1@gmail.com>
Subject: Re: [PATCH v4 0/5] platform/x86 acer-wmi: Improve platform profile
 handling
Message-Id: <173695186401.7584.2765000569734785177.b4-ty@linux.intel.com>
Date: Wed, 15 Jan 2025 16:37:44 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Mon, 13 Jan 2025 18:44:08 +0530, Hridesh MG wrote:

> This patch improves the platform profile handling for laptops using the
> Acer Predator interface by making the following changes -
> 
> 1) Using WMI calls to fetch the current platform profile instead of
>    directly accessing it from the EC. A new helper function is
>    introduced for this purpose.
> 2) Simplifying the cycling of platform profiles by making use of
>    platform_profile_cycle()
> 3) Using an ACPI bitmap to dynamically set platform_profile_choices to
>    better reflect the supported profiles.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/5] platform/x86: acer-wmi: use WMI calls for platform profile handling
      commit: 2d76708c2221dde33d86aeef19f6d7d5f62148b4
[2/5] platform/x86: acer-wmi: use new helper function for setting overclocks
      commit: cd44e09bb89d4a33514b9ec3d972f0d2d13f5cfd
[3/5] platform/x86: acer-wmi: simplify platform profile cycling
      commit: 61c461a90fbfc038d9663713f293d60fcb58c41d
[4/5] platform/x86: acer-wmi: use an ACPI bitmap to set the platform profile choices
      commit: 191e21f1a4c3948957adc037734449f4a965dec5
[5/5] platform/x86: acer-wmi: add support for Acer Nitro AN515-58
      commit: 549fcf58cf5837d401d0de906093169b05365609

--
 i.

