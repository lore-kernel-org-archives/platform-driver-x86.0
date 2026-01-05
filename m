Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 383B9261B8C;
	Mon,  5 Jan 2026 15:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767626922; cv=none; b=oz5QJ4h+fxZKWVyhf+saxCJMxMOU8lljhWoBSNXd7zD0YaFPm31cyZUqQ6kicn8tpGY6wnBVPxlD6zlsv9upJreRPnV6QgVfdwkJtnjUDtw7pj5tL8Dx7ZzMuCdQ/ZByhobzZAvrht8F/RuwBlrBUhLT1KTYom9wCjKJPb+iQAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767626922; c=relaxed/simple;
	bh=Uy7pYu26uer07+O3EOVZgfhxsag1+Ac8oU3E5mulsSQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=h/4Rlz90fxDqnIAKOU9Q+gHvVV97Vbpg5AQIHOzSubbXjPdtg4N407+mJsJvz2riA9JrboRrIUHCCPSg1SiGlLyxlCLCqCdnxEfKFF6o0i+1pV6XrxTDy/P79C6A8fQjdJMzGZteQ3kVePWwHYsodaI0tazo9Z+Go5RYGTgh/R0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lj2hC8QV; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lj2hC8QV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767626920; x=1799162920;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=Uy7pYu26uer07+O3EOVZgfhxsag1+Ac8oU3E5mulsSQ=;
  b=Lj2hC8QVwy1w5bG7hECdPXB6FTovBuqPAkkSZL8wgFM7uhbupoEr7oa+
   BtafZ44CEvcxDiFqpjVKuZ2MdOyJ/LPFkafyuSaXx++pd1eM6UpgTLgge
   2NNcNmSn9HHEf/1lALKaAlX7mMH/1xg2EuA276HLBTT6mTdNIctxv0jZQ
   ycByqNAL0GgNlAGnKtz2QKZWJGy/uFsWNzbNdL+TAFESNH7oyXguxD1ia
   /UQ+9WBej4PJPCiWKTnVVmTO8N+bWLcaaQu2q8ZQxHpGJx6/+d6nECzII
   66osv/H0Ehg/B/xUvJNrKkhmli1mSoKJybACAHemnmhN/SqXu5yXkNu88
   w==;
X-CSE-ConnectionGUID: o2jLf6GKRYSiGQfNHkWR6w==
X-CSE-MsgGUID: rT8fxjC5RhuMKZ/o2pXA/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="56553650"
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; 
   d="scan'208";a="56553650"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2026 07:28:40 -0800
X-CSE-ConnectionGUID: SfePEtlBQDi9x4GyDeEUoA==
X-CSE-MsgGUID: 6BmAyrlOR8yIoiCOmCp42A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; 
   d="scan'208";a="201535312"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.202])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2026 07:28:36 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: linux-kernel@vger.kernel.org, Denis Benato <denis.benato@linux.dev>
Cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hansg@kernel.org>, 
 "Luke D . Jones" <luke@ljones.dev>, Mateusz Schyboll <dragonn@op.pl>, 
 Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <20260103003731.404383-1-denis.benato@linux.dev>
References: <20260103003731.404383-1-denis.benato@linux.dev>
Subject: Re: [PATCH 0/3] asus-armoury: add support for GA403WM and improve
 GA403U
Message-Id: <176762690376.2517.9368046117647921854.b4-ty@linux.intel.com>
Date: Mon, 05 Jan 2026 17:28:23 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Sat, 03 Jan 2026 01:37:28 +0100, Denis Benato wrote:

> Happy new year! This series adds support for the ASUS ROG Zephyrus G14 GA403WM
> model: the previous patch for GA403WM has probably slipped through because
> of me sending it as soon as I could and users adding models with only a few
> hours sifference from each other.
> 
> In addition I noticed people sending more GA403U ppt values: they are the same
> as GA403UI, but I want to be on the safe side so GA403U is now matching only
> GA403UI and I have added a new entry for GA403UV.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/3] platform/x86: asus-armoury: add support for GA403WM
      commit: f5fc40734b0fcd356eabb8ab5abd57b80c286da6
[2/3] asus-armoury: fix ppt data for GA403U* renaming to GA403UI
      commit: 487764a514e97e3b921c4eb13ab35920e09f6b7d
[3/3] platform/x86: asus-armoury: add support for GA403UV
      commit: a54e9902e7edf74d0f305fb9107d15daa6549c2c

--
 i.

