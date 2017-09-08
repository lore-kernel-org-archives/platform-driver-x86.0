From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v2] Add driver to force WMI Thunderbolt controller power
 status
Date: Fri, 8 Sep 2017 11:07:29 +0300
Message-ID: <20170908080729.GT2477@lahna.fi.intel.com>
References: <1504810042-4696-1-git-send-email-mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1504810042-4696-1-git-send-email-mario.limonciello@dell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mario Limonciello <mario.limonciello@dell.com>
Cc: dvhart@infradead.org, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Richard Hughes <hughsient@gmail.com>, Yehezkel Bernat <yehezkelshb@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Sep 07, 2017 at 01:47:22PM -0500, Mario Limonciello wrote:

I have a small comment which you might want to consider.

> +static int intel_wmi_thunderbolt_probe(struct wmi_device *wdev)
> +{
> +	return sysfs_create_group(&wdev->dev.kobj, &tbt_attribute_group);
> +}
> +
> +static int intel_wmi_thunderbolt_remove(struct wmi_device *wdev)
> +{
> +	sysfs_remove_group(&wdev->dev.kobj, &tbt_attribute_group);
> +	return 0;
> +}

In order to notify userspace about this, what if you send KOBJ_CHANGE
for the wdev when you add/remove this attribute?
