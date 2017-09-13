From: Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH v3] Add driver to force WMI Thunderbolt controller power
 status
Date: Wed, 13 Sep 2017 19:20:24 +0200
Message-ID: <20170913172024.GA8782@wunner.de>
References: <1504884191-16528-1-git-send-email-mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1504884191-16528-1-git-send-email-mario.limonciello@dell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mario Limonciello <mario.limonciello@dell.com>
Cc: dvhart@infradead.org, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Richard Hughes <hughsient@gmail.com>, Yehezkel Bernat <yehezkelshb@gmail.com>, Mika Westerberg <mika.westerberg@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

Sorry, late to the party.

On Fri, Sep 08, 2017 at 10:23:11AM -0500, Mario Limonciello wrote:
> +	mode = hex_to_bin(buf[0]);
> +	if (mode == 0 || mode == 1) {
> +		status = wmi_evaluate_method(INTEL_WMI_THUNDERBOLT_GUID, 0, 1,
> +					     &input, NULL);
> +		if (ACPI_FAILURE(status)) {
> +			pr_err("intel-wmi-thunderbolt: failed setting %s\n",
> +			       buf);
> +			return -ENODEV;
> +		}
> +	} else {
> +		pr_err("intel-wmi-thunderbolt: unsupported mode: %d", mode);
> +	}
> +	return count;
> +}

Seems odd to allow user space to fill the log by writing invalid data
to sysfs, likewise that success is returned in the else case.
I'd drop both pr_err() and return -EINVAL in the else case.


> +static const struct wmi_device_id intel_wmi_thunderbolt_id_table[] = {
> +	{ .guid_string = INTEL_WMI_THUNDERBOLT_GUID },
> +	{ },
> +};

I'm not familiar with WMI, but don't you need a MODULE_DEVICE_TABLE here?
How does user space know which module to load upon receiving the uevent?

Thanks,

Lukas
