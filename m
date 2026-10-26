Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793053375;
	b=QOsk2K1X5PPNjiRhX6hIe88MpZqMUWbFA91/XXkNnxVIcNM/M4nqWDe9JU/+k9a/DPkz
	 oU/7fVt56Xs6BR8Kxe6Nwne5L+ag4WZNaC0NLhtmNllj40wdGg5PgvvHy1n1Q5nLHDZpT
	 QlZEbfdThCL5r4Qjjib4GbzZlDNqwYWDn5BQ9cBYIUV6gahvrZusrgJiRVkUjD0mprvxe
	 /aFzUFZIKxtJjWx3m7USbuIEWYBVD/XAyONuQPEqEHm495j+DY712rVXl6MxrbXr/Mef3
	 dmTmEr/13R0FrxanSJvIDz3R5gqaR76OmR5eHV57nCWAUy2gloUx+g8YubX702C+8Hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793053375;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=dV1881HEeEtEiUTYAXLH0Ho3cOZgw7Cwho1AbJrtE2E=;
	b=s/xoz3i9OiIlQpzbS/1tknB5HG7hFrdhqWdE7ysuP+9S5TDXrHr11cyDkVEQCnJLWKjg
	 Ny9VhpPV6/mx91K58mDH7k2zD7eGbrCBDjcsn8pAnZeL3cdfs3k0hQodMSTwtS4MvsvHj
	 86fARFfedsd8mFwUKD0dIPh+Q9F4BTuS/UrWxXzawACTfXf+jfum0kHYNbCp4dlNZzw/O
	 nqWErK/377JWfovwJ5pdZIxTasRrAKVCT7Pxt8DR7yjDm5qgt7dWovdU4usYjubmHkcuW
	 hhMvdzTqS916H7l7JPiI6hm5fpahnByuEuWhVB6YyOJkpuDtl9B+91zgYz6uV24zQ6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TxXa2YZy;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF5BE606A31D;
	Mon, 26 Oct 2026 22:22:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF5BE606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TxXa2YZy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793053374; x=1824589374;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=q5I42LJ+Ggvbwqnw/q5HRxVak1prfcKrwrjhtIMtmLQ=;
  b=TxXa2YZyIiORib8VEl0NB7wMIRMMww4n+o5Z+ehVJb5AmtFTdoCjfnre
   UFnsjEn0C3SoAMdL8+g+tNC5GALQQZaxtp1T5eY0dkhnRWojhDFRrLEY4
   Ar4WMJeNxbfJlK5LRQjcWt6czpseIfdNbThKkfxP9opyDKw6S+5OVGcQA
   2zC5OXzTXG/4guNIrey7zNd9AjRALE+iGRs/9T96JgRXt+nfGqlZ9JbLP
   oZa/OC6afuibze+twLr7Fxr55s/R3To/+SSFLzWeq/YFrbKLCYUGjkE9j
   Bl0vSXIGTLTLYxQ7UaJW3u+IjH6GnqI3fPLoxucUdk9FaHQvwO4L0CjJ+
   Q==;
X-CSE-ConnectionGUID: QeCtEhnRQm+7XgReaS9wBQ==
X-CSE-MsgGUID: T3/d4BWFTjidyo9hC5tKzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1769679"
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="1769679"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 15:22:49 -0700
X-CSE-ConnectionGUID: uJMEBo1OQ72a6KADbad8gA==
X-CSE-MsgGUID: u7KF62snTnaBZeqPRxA/dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="4246512"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 26 Oct 2026 15:22:45 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLT5V-00000000WXw-1Zg3;
	Mon, 26 Oct 2026 22:22:41 +0000
Date: Tue, 27 Oct 2026 06:21:46 +0800
From: kernel test robot <lkp@intel.com>
To: Mingyou Chen <qby140326@gmail.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilya Gladyshev <ilya.gladyshev@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev, KentoNion <kento@kekto.ru>,
	platform-driver-x86@vger.kernel.org,
	ted eric <ericted8810@gmail.com>, Armin Wolf <W_Armin@gmx.de>,
	linux-kernel@vger.kernel.org, Chris Taraszka <chris@miget.com>,
	Matias Civadda <matias.civadda2342001@gmail.com>,
	=?utf-8?B?6auYIOS/iuaWhw==?= <btx342@gmail.com>,
	powerfullz <wleizc7319@gmail.com>,
	=?utf-8?B?5a2ZIOiqiemTrQ==?= <wolf109909@outlook.com>,
	=?utf-8?B?TWlsb8Wh?= Vlku <vlku.milos.fun@gmail.com>,
	Rsplwe <i@rsplwe.com>, Bozhen Peng <bozhenpeng93@gmail.com>,
	Anton Karasev <uselessfire@gmail.com>,
	Jame Jao <jaojame6@gmail.com>,
	Serhiy Shliapuhin <shlyapugin@gmail.com>,
	Mingyou Chen <qby140326@gmail.com>
Subject: Re: [PATCH v14 4/6] platform/x86: redmi-wmi: Drop redmi-wmi driver
Message-ID: <202610270608.l51GVbZ8-lkp@intel.com>
References: <20261026102101.224568-5-qby140326@gmail.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261026102101.224568-5-qby140326@gmail.com>

Hi Mingyou,

kernel test robot noticed the following build errors:

[auto build test ERROR on 9d3475065167197742b0882aff21cf8e78393277]

url:    https://github.com/intel-lab-lkp/linux/commits/Mingyou-Chen/MAINTAINERS-Add-maintainer-entry-of-bitland-mifs-wmi-driver/20261026-182056
base:   9d3475065167197742b0882aff21cf8e78393277
patch link:    https://lore.kernel.org/r/20261026102101.224568-5-qby140326%40gmail.com
patch subject: [PATCH v14 4/6] platform/x86: redmi-wmi: Drop redmi-wmi driver
config: x86_64-rhel-9.4-ltp (attached as .config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261027/202610270608.l51GVbZ8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610270608.l51GVbZ8-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error: recursive dependency detected!
   symbol BITLAND_MIFS_WMI is selected by REDMI_WMI
   symbol REDMI_WMI default value contains BITLAND_MIFS_WMI
   For a resolution refer to Documentation/kbuild/kconfig-language.rst
   subsection "Kconfig recursive dependency limitations"

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
