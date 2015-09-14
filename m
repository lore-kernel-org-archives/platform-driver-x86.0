From: "Zha, Qipeng" <qipeng.zha@intel.com>
Subject: RE: [PATCH v4] platform:x86: add Intel P-Unit mailbox IPC driver
Date: Mon, 14 Sep 2015 02:42:53 +0000
Message-ID: <C6287702A945AC47BE5DB5DFD4B5C6DD0195E6D4@SHSMSX104.ccr.corp.intel.com>
References: <1441708182-66875-1-git-send-email-qipeng.zha@intel.com>
 <40786695AB8ED34B85C0BFEA910C834433C576F1@IRSMSX103.ger.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:17227 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753738AbbINCp2 convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 13 Sep 2015 22:45:28 -0400
In-Reply-To: <40786695AB8ED34B85C0BFEA910C834433C576F1@IRSMSX103.ger.corp.intel.com>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "Shevchenko, Andriy" <andriy.shevchenko@intel.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Cc: "dvhart@infradead.org" <dvhart@infradead.org>, "Westerberg, Mika" <mika.westerberg@intel.com>

>> +struct intel_punit_ipc_controller {
>> +	struct platform_device *pdev;

>Usually we keep pointer to struct device. Any specific reason to hold platform_device here?
Because intel_punit_get_bars() need to use platform_device pointer to get resources.

>> +
>> +static int intel_punit_ipc_check_status(void)
>> +{
>> +	int loops = CMD_TIMEOUT_SECONDS * USEC_PER_SEC;

From where is this timeout in *seconds* coming? Sounds too
> big for me.
Empirical value from SCU ipc driver.

> +	res0 = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!res0) {
> +		dev_err(&pdev->dev, "Failed to get iomem
> resource\n");
> +		return -ENXIO;
> +	}
> +	size = resource_size(res0);
> +	if (!devm_request_mem_region(&pdev->dev, res0->start,
> +				     size, pdev-
> >name)) {

>Why not to use devm_ioremap_resource() ?

>> +	ipcdev.base[BIOS_MAILBOX] = addr;
>> +	addr += MAILBOX_REGISTER_SPACE;
>> +	ipcdev.base[GTDRIVER_MAILBOX] = addr;
>> +	addr += MAILBOX_REGISTER_SPACE;
>> +	ipcdev.base[ISPDRIVER_MAILBOX] = addr;

>Looks akward, does the platform have the several resources for different purpose? Why do you unify them (who does guarantee the non-breakable segment for all resources?) first and then split up?

>Please, refactor.
From spec, these three parts are consecutive, so only define one acpi resource entry is reasonable way,
But BIOS maintainer finally make the resource like this due to request from Window os driver,
So can't treat these three as three separate parts.

>> +
>> +/* Some modules are dependent on this, so init earlier */
>> +fs_initcall(intel_punit_ipc_init);

>So, what exactly requires this?
Those drivers which need to use this Punit APIs in its Probe when do module init.
