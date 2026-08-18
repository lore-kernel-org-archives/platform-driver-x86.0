Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6CFC4582E5;
	Tue, 18 Aug 2026 11:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787052030; cv=none; b=UeEU9a0ZGdVSPyd924hxI6rmqi9iaoLAtlDS7ciXOLWY8UOCSAuqfQPdPoNcXUk3YH6jgFehWcZ7ciPRWbHsPwe+mp8HwGf6AzapZ4OAoo9c/sbvuuuqr+w3HOxaWpsktZwCXlRXNU/mHGyGmH0n6Q9H0cclSmQ+1/R8HVygI+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787052030; c=relaxed/simple;
	bh=oXqF/++1oFCZ+jsLf5DH63eFQevN/fALzcu6xjxbSFk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=GERRb9+4zXjwZxmTtDxcobvVnde3q01Ryt4TIlAh5Hvb/P63sIi1KO2Yhc5KvCH9CdRKuMU9dvDiGo9wnqJmJGC3eDEgYinu7eOJQzfhEMrehf0UHoK+YpLEhPEx2z5mh4I8inujChWfXQ8W+jc8vuDcDvLjQDrtfOncCInZplw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rv9E28Fc; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rv9E28Fc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787052029; x=1818588029;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=oXqF/++1oFCZ+jsLf5DH63eFQevN/fALzcu6xjxbSFk=;
  b=Rv9E28FchZYXlt7/HOBmFNy74ahizpLeaSL3VDcjPBnJNUVDggPCTWWp
   DlLK6t1k7xAzeVVuhaLoxRoFlTtg5Bwf50TvOyLIy2dzJ4zgDy/oUzHAc
   DtNI3LjCrZObNYT9AFlCoPMHwzBbDfr3pGn2v/Gxf37VomwwkEvpLl3lH
   D1Z6FVQQmY4zGS4uTDtGbM4pyQ7xOSRDgkgjqLuM5K2TrA6f+5n5HNBMQ
   W3vrljA8quFkZAPkUj5q+fgqmkFqR67Qahw3DeRpMk0e0rnaiVa+iKeyy
   r2PEfrIWygyN0cLz70H3SXI5ktzBwOF9rRUdrwoh7t8FaVT+S7P2fqYLi
   A==;
X-CSE-ConnectionGUID: NufcCcJHQLmjCmHa/8AGHw==
X-CSE-MsgGUID: FZS6BFZkRJudljYdLymVkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="75071445"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="75071445"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 04:20:28 -0700
X-CSE-ConnectionGUID: Z0BpGri9QAWO26/G3jrLxA==
X-CSE-MsgGUID: FCTXg8nTQ3eP1qE3KuqTcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="303423641"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.38])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 04:20:26 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hansg@kernel.org, Suryansh Singh <technosfan14@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260818082925.14854-1-technosfan14@gmail.com>
References: <20260818082925.14854-1-technosfan14@gmail.com>
Subject: Re: [PATCH] platform/x86: hp-wmi: Add OMEN board 8A43 thermal
 profile support
Message-Id: <178705202157.11998.5608160084298118416.b4-ty@b4>
Date: Tue, 18 Aug 2026 14:20:21 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Tue, 18 Aug 2026 13:59:25 +0530, Suryansh Singh wrote:

> The HP OMEN 16-n0xxx AMD (board ID: 8A43) supports the existing
> OMEN thermal profile handling.
> 
> Add the DMI board name to omen_thermal_profile_boards[] so that
> the existing thermal profile support is enabled for this board.
> 
> This enables the existing fan control and platform profile
> handling for 8A43.
> 
> [...]

Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

FYI [if applicable to your patch], as per Linus' policy change, also
fixes are mostly routed through for-next unless the fix is for a
commit introduced in the most recent cycle or is clearly a regression
fix.

The list of commits applied:
[1/1] platform/x86: hp-wmi: Add OMEN board 8A43 thermal profile support
      commit: 2fb7ed607f37c598708860928c0b362a98a4663d

--
 i.

