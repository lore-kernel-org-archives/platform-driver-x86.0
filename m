From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: Re: intel_turbo_max_3 non-modularity
Date: Fri, 28 Apr 2017 13:35:35 -0700
Message-ID: <1493411735.69096.494.camel@linux.intel.com>
References: <20170424113103.0de3ea31@endymion>
         <20170424140218.GR16239@windriver.com> <20170427214843.GB29261@fury>
         <1493335126.69096.481.camel@linux.intel.com>
         <20170428104010.2fc36751@endymion>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga05.intel.com ([192.55.52.43]:33823 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S939582AbdD1Ufi (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 28 Apr 2017 16:35:38 -0400
In-Reply-To: <20170428104010.2fc36751@endymion>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jean Delvare <jdelvare@suse.de>
Cc: Darren Hart <dvhart@infradead.org>, Paul Gortmaker <paul.gortmaker@windriver.com>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>

Hi Jean,


[...]

> > 
> By the way, is there any fundamental reason why intel_pstate could
> not
> be modularized? Or was it just another instance of needing functions
> which were not exported yet? I know that the intel_pstate driver is
> widely used nowadays, but still, this is a CPU-specific driver that
> not all x86 users need, and it isn't slim. It would be nice to be
> able
> to build it as a module too.
> 
I wish it can be a module. The problem is the race between acpi-cpufreq 
and intel_pstate when built as modules. Since every distribution will
have both of these configs set.
Based on the load order any of this driver can load as cpufreq scaling
driver. We want intel_pstate should be tried first and if can't be
supported then acpi-cpufreq should be used.

There are two PM trace event this depends on, which require built in
but that can be solved.

So if anybody has suggestion on how to solve this, this can be done.

Thanks,
Srinivas
