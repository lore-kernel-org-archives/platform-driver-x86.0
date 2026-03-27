Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF52134A3D8;
	Fri, 27 Mar 2026 17:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774634225; cv=none; b=Td8SPIWghd4LJkATb1WRXrOdwzTpWJH3zcAnCUZZ25z5EZxgr6qd3vgSLGiYgwSptzgF61hOh/ol+cdp0eebbzWKrsPJLtTU75uVz1xGk59Rc96uz3Zr1Jgf/51qUEh35wNn5+oior3Tb34IZ4Y2FiFZsE4RhW/6Uq6PVW5ma5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774634225; c=relaxed/simple;
	bh=4PihExu4c3/hAyx0nP9vdMuAu0rgU/EvX03Qkio87xU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pO+bI4tMjwm+NHkzrnxV4v7guxLaPT6PVhoq0OZE7d0EQcsiF8FJvmdA7YdNUkdDUPH2+FnAhPs45dboMXhtqj5lUWIizowIzCPiTG1SajoJlrYZSfFMSiUrjyfLjDeEon8BF5WctOoj/gjp0ybwdVbccSWSoXx2jUUwd6es5NA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NJkXou5B; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NJkXou5B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774634224; x=1806170224;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=4PihExu4c3/hAyx0nP9vdMuAu0rgU/EvX03Qkio87xU=;
  b=NJkXou5BHD0Nll4K8wGN7Cq0Wx88nmhLy/kDrUlU8dToID4VPx/Gd0g8
   qMgZt0JQxg7J6HoPIAWEYgE6OGbPRyg5nXYdPKa+qvdYnLKwjs41W9GaL
   O/xz7zjJVSzj4U2jAF4NRPwT0mA+BWg87+lrGj23OGShp0ccr4h4b5Ts9
   Px3Md3V3Yu9KYdKw7coZ44zQqId+UXNFuZEzpvKd4Z846RtjDzg3ETiev
   8607vNbzm6Ksa0iOEpzh8rzDdY0usoLYFuuG2zm3jQc30F711vuIyy6XH
   M9yO9EL1jO967Bsa1paoexo5jiiYu0E9/+Ku54tqkE8lR4WuLw3LlbZe+
   g==;
X-CSE-ConnectionGUID: 2tmDOXwzRa+Uqo5fwdJUHg==
X-CSE-MsgGUID: whhwYRwxQreV3IlaL3M9eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="75738160"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="75738160"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 10:57:03 -0700
X-CSE-ConnectionGUID: 7pCZLR/fRIqI5gn8Eioz2A==
X-CSE-MsgGUID: waS2y2YRSoilyzOa+9m5uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="225297379"
Received: from linux.intel.com ([10.54.29.200])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 10:57:03 -0700
Received: from [10.245.244.175] (abityuts-desk.ger.corp.intel.com [10.245.244.175])
	by linux.intel.com (Postfix) with ESMTP id 33F0F20B5720;
	Fri, 27 Mar 2026 10:56:59 -0700 (PDT)
Message-ID: <91fdbcb6a8391cf945e53bccc3ae6f6f11412867.camel@linux.intel.com>
Subject: Re: [PATCH v1 1/2] platform/x86/intel-uncore-freq: Rename
 instance_id
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: Maciej Wieczor-Retman <m.wieczorretman@pm.me>, hansg@kernel.org, 
	srinivas.pandruvada@linux.intel.com, ilpo.jarvinen@linux.intel.com
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Date: Fri, 27 Mar 2026 19:56:58 +0200
In-Reply-To: <3c02a8e3c1d4f07fa7f37740c33050c4e1d3f6ee.1774625521.git.m.wieczorretman@pm.me>
References: <cover.1774625521.git.m.wieczorretman@pm.me>
	 <3c02a8e3c1d4f07fa7f37740c33050c4e1d3f6ee.1774625521.git.m.wieczorretman@pm.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2026-03-27 at 15:36 +0000, Maciej Wieczor-Retman wrote:
> =C2=A0 * @die_id:		Die id for this instance
> =C2=A0 * @domain_id:		Power domain id for this instance
> =C2=A0 * @cluster_id:		cluster id in a domain
> - * @instance_id:	Unique instance id to append to directory name
> + * @seqname_id:		Unique id to append to directory name
> =C2=A0 * @name:		Sysfs entry name for this instance
> =C2=A0 * @agent_type_mask:	Bit mask of all hardware agents for this domai=
n
> =C2=A0 * @uncore_attr_group:	Attribute group storage
> @@ -71,7 +71,7 @@ struct uncore_data {
> =C2=A0	int die_id;
> =C2=A0	int domain_id;
> =C2=A0	int cluster_id;
> -	int instance_id;
> +	int seqname_id;
> =C2=A0	char name[32];
> =C2=A0	u16=C2=A0 agent_type_mask;

Nitpick: "seqname_id" reads like "sequence name ID" rather than a
sequence number. Consider "seqnum" or "sequence_id" for better clarity.
Just a suggestion based on how the name comes across, but not big deal.

Artem.
