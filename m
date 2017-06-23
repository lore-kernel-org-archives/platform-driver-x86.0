From: "Chakravarty, Souvik K" <souvik.k.chakravarty@intel.com>
Subject: RE: [PATCH] x86/intel_telemetry: Add debugfs entry for S0ix
 residency
Date: Fri, 23 Jun 2017 03:12:00 +0000
Message-ID: <5F7315E704FA0841B5DFCE90329B2BB462E8C986@BGSMSX102.gar.corp.intel.com>
References: <1498138918-30544-1-git-send-email-rajneesh.bhardwaj@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga04.intel.com ([192.55.52.120]:15914 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753925AbdFWDMF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 22 Jun 2017 23:12:05 -0400
In-Reply-To: <1498138918-30544-1-git-send-email-rajneesh.bhardwaj@intel.com>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "Bhardwaj, Rajneesh" <rajneesh.bhardwaj@intel.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Cc: "dvhart@infradead.org" <dvhart@infradead.org>, "andy@infradead.org" <andy@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Murthy, Shanth" <shanth.murthy@intel.com>

Seems to be an useful data to provide. 
+1 from me.

> -----Original Message-----
> From: Bhardwaj, Rajneesh
> Sent: Thursday, June 22, 2017 7:12 PM
> To: platform-driver-x86@vger.kernel.org
> Cc: dvhart@infradead.org; andy@infradead.org; linux-
> kernel@vger.kernel.org; Murthy, Shanth <shanth.murthy@intel.com>;
> Chakravarty, Souvik K <souvik.k.chakravarty@intel.com>; Bhardwaj,
> Rajneesh <rajneesh.bhardwaj@intel.com>
> Subject: [PATCH] x86/intel_telemetry: Add debugfs entry for S0ix residency
> 
> This adds a debugfs consumer for the exported kernel API
> intel_pmc_read_s0ix_residency. This debugfs entry reads S0ix residency
> directly from the PMC hardware counters.
> 
> TEST:
> - echo freeze > /sys/power/state
> - Wake the system, read the S0ix residency i.e.
>   cat /sys/kernel/debug/telemetry/s0ix_residency_usec
> 
> Signed-off-by: Shanth Murthy <shanth.murthy@intel.com>
> Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
> ---
>  drivers/platform/x86/intel_telemetry_debugfs.c | 26
> ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel_telemetry_debugfs.c
> b/drivers/platform/x86/intel_telemetry_debugfs.c
> index efc0140..2eacb16 100644
> --- a/drivers/platform/x86/intel_telemetry_debugfs.c
> +++ b/drivers/platform/x86/intel_telemetry_debugfs.c
> @@ -713,6 +713,24 @@ static int telem_soc_state_open(struct inode
> *inode, struct file *file)
>  	.release	= single_release,
>  };
> 
> +static int telem_s0ix_res_get(void *data, u64 *val) {
> +	u64 s0ix_total_res = 0;
> +	int ret;
> +
> +	ret = intel_pmc_s0ix_counter_read(&s0ix_total_res);
> +	if (ret) {
> +		pr_err("Failed to read S0ix residency");
> +		return ret;
> +	}
> +
> +	*val = s0ix_total_res;
> +
> +	return 0;
> +}
> +
> +DEFINE_DEBUGFS_ATTRIBUTE(telem_s0ix_fops, telem_s0ix_res_get, NULL,
> +"%llu\n");
> +
>  static int telem_pss_trc_verb_show(struct seq_file *s, void *unused)  {
>  	u32 verbosity;
> @@ -994,6 +1012,14 @@ static int __init telemetry_debugfs_init(void)
>  		goto out;
>  	}
> 
> +	f = debugfs_create_file("s0ix_residency_usec", S_IFREG | S_IRUGO,
> +				debugfs_conf->telemetry_dbg_dir,
> +				NULL, &telem_s0ix_fops);
> +	if (!f) {
> +		pr_err("s0ix_residency_us debugfs register failed\n");
> +		goto out;
> +	}
> +
>  	f = debugfs_create_file("pss_trace_verbosity", S_IFREG | S_IRUGO,
>  				debugfs_conf->telemetry_dbg_dir, NULL,
>  				&telem_pss_trc_verb_ops);
> --
> 1.9.1
