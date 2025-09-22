Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C052D94B3
	for <platform-driver-x86@vger.kernel.org>; Mon, 22 Sep 2025 16:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758557984; cv=none; b=u5QtltIC20wv2/NO2keKpJY/MOVDDx0fiO3u4VqyFKT4svHiH5RUxQk52WiGht5W1sRLI8+F74RhwF9As6h6MNYwbw2fdhdauBtQdsib/m08ffntdCOpva6flvIepKeOr/TrSxg2quWNPEovK5eoZ0vOBiUQwg/96unj7Pf1SfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758557984; c=relaxed/simple;
	bh=rrxeoaHPc0j0Z2zOky6NHskGX6aK1lZaE+m6vuePrZU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D5B3Xe7mVPc2d1m7pOVZBILSqUOOCvoCM2mZxMDHprR7ZSJPvAOePg76NII2oSg5USKDug9lXlzhIlOpvve2LERqTR2xClpX0T/9BJ85IkcIyrTOir5eTmfwVZSkHniYksVfdpiJatIsaxyMxVMs3EooPMcXiyarGQAPRGvC+fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uytd7uRX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uytd7uRX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12D11C4CEF0;
	Mon, 22 Sep 2025 16:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758557983;
	bh=rrxeoaHPc0j0Z2zOky6NHskGX6aK1lZaE+m6vuePrZU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=uytd7uRX20NcfinCLaNojDP7ImMO+MVvYEEn8RUmN/UPRlVgWYzykyxyhAFff05Td
	 MTdtcsdP6fcikKT+C1wYg5rWwaWAIHtjp6b1DYgWwL+mB//36kms9ttJVjU5afipzZ
	 MGQ8WfkzfisuP6ToWU8lhEBXJxo5B2bDLAvZBYFjbycjS5ZuMbhEp9d8JiJI7Qu0O9
	 CzCEtXb+pQj2lByGfWSNkU6bTnuL4qdGywWiw4X/XlJFqWFY15K+OoP4W79e57z4o1
	 u8BQeCnESOMBYdf859eUR15JTVEGetgavwdnRWT+FQ4SPWGX17H0ROYTsv70LZHnxO
	 Qd4fF6cjnQ9NA==
Message-ID: <66465479-3e6f-41b4-9ed1-f91d3cd386d8@kernel.org>
Date: Mon, 22 Sep 2025 11:19:41 -0500
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] platform/x86/amd/pmf: Introduce new interface to
 export NPU metrics
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com, Lizhi Hou <lizhi.hou@amd.com>
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20250919055425.3055817-1-Shyam-sundar.S-k@amd.com>
 <20250919055425.3055817-2-Shyam-sundar.S-k@amd.com>
 <be724b4b-516c-4f1c-9994-d0aba505284d@amd.com>
 <3adcc07c-d87c-4f69-a045-d923269fc029@amd.com>
Content-Language: en-US
From: "Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>
In-Reply-To: <3adcc07c-d87c-4f69-a045-d923269fc029@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 9/22/2025 11:07 AM, Shyam Sundar S K wrote:
> 
> 
> On 9/19/2025 19:51, Mario Limonciello wrote:
>> On 9/19/2025 12:54 AM, Shyam Sundar S K wrote:
>>> The PMF driver retrieves NPU metrics data from the PMFW. This commit
>>> introduces a new interface to make NPU metrics accessible to other
>>> drivers like AMDXDNA driver, which can access and utilize this
>>> information as needed.
>>>
>>> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>>> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>
>> +Lizhi for comments.
>>
>> As this interface will be something amdxdna uses I think we should
>> make sure there is a R-b from Lizhi.
> 
> Sure.

With the comments you shared I personally have no concerns that need 
addressing.

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>

> 
>>
>> I have a few comments below as well.
>>
>>> ---
>>> Hi Ilpo, this can be applied on origin/review-ilpo-next with git tip
>>> commit
>>> "8236b4667aca"
>>>
>>>    drivers/platform/x86/amd/pmf/core.c | 60 +++++++++++++++++++++++++
>>> ++++
>>>    drivers/platform/x86/amd/pmf/pmf.h  |  1 +
>>>    include/linux/amd-pmf-io.h          | 21 ++++++++++
>>>    3 files changed, 82 insertions(+)
>>>
>>> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/
>>> x86/amd/pmf/core.c
>>> index ef988605c4da..75529047377c 100644
>>> --- a/drivers/platform/x86/amd/pmf/core.c
>>> +++ b/drivers/platform/x86/amd/pmf/core.c
>>> @@ -8,6 +8,7 @@
>>>     * Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>>     */
>>>    +#include <linux/amd-pmf-io.h>
>>>    #include <linux/debugfs.h>
>>>    #include <linux/iopoll.h>
>>>    #include <linux/module.h>
>>> @@ -53,6 +54,8 @@ static bool force_load;
>>>    module_param(force_load, bool, 0444);
>>>    MODULE_PARM_DESC(force_load, "Force load this driver on supported
>>> older platforms (experimental)");
>>>    +static struct device *pmf;
>>> +
>>>    static int amd_pmf_pwr_src_notify_call(struct notifier_block *nb,
>>> unsigned long event, void *data)
>>>    {
>>>        struct amd_pmf_dev *pmf = container_of(nb, struct amd_pmf_dev,
>>> pwr_src_notifier);
>>> @@ -314,6 +317,61 @@ int amd_pmf_init_metrics_table(struct
>>> amd_pmf_dev *dev)
>>>        return 0;
>>>    }
>>>    +static int is_npu_metrics_supported(struct amd_pmf_dev *pdev)
>>> +{
>>> +    switch (pdev->cpu_id) {
>>> +    case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
>>> +    case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
>>
>> I'm a bit surprised AMD_CPU_ID_PS isn't in this list.  Does it not
>> have the same interface?
> 
> Intial thoughts is to have support starting from 1Ah. Based on futher
> tests we can extend this to older platforms as well, albeit I am not
> sure if PMFW provides this information for older ones. So it would be
> on the wishlist.

Got it, thanks for clarification.

> 
> 
>>
>>> +        return 0;
>>> +    default:
>>> +        return -EOPNOTSUPP;
>>> +    }
>>> +}
>>> +
>>> +static int amd_pmf_get_smu_metrics(struct amd_pmf_dev *dev, struct
>>> amd_pmf_npu_metrics *data)
>>> +{
>>> +    int ret, i;
>>> +
>>> +    if (is_npu_metrics_supported(dev))
>>> +        return -EINVAL;
>>> +
>>> +    ret = amd_pmf_set_dram_addr(dev, true);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    memset(dev->buf, 0, dev->mtable_size);
>>> +
>>> +    /* Send SMU command to get NPU metrics */
>>> +    ret = amd_pmf_send_cmd(dev, SET_TRANSFER_TABLE, 0, 7, NULL);
>>> +    if (ret) {
>>> +        dev_err(dev->dev, "SMU command failed to get NPU metrics:
>>> %d\n", ret);
>>> +        return ret;
>>> +    }
>>> +
>>> +    memcpy(&dev->m_table_v2, dev->buf, dev->mtable_size);
>>> +
>>> +    data->npuclk_freq = dev->m_table_v2.npuclk_freq;
>>> +    for (i = 0; i < ARRAY_SIZE(data->npu_busy); i++)
>>> +        data->npu_busy[i] = dev->m_table_v2.npu_busy[i];
>>> +    data->npu_power = dev->m_table_v2.npu_power;
>>> +    data->mpnpuclk_freq = dev->m_table_v2.mpnpuclk_freq;
>>> +    data->npu_reads = dev->m_table_v2.npu_reads;
>>> +    data->npu_writes = dev->m_table_v2.npu_writes;
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +int amd_pmf_get_npu_data(struct amd_pmf_npu_metrics *info)
>>> +{
>>> +    struct amd_pmf_dev *pdev = dev_get_drvdata(pmf);
>>> +
>>> +    if (!pdev || !info)
>>> +        return -EINVAL;
>>> +
>>> +    return amd_pmf_get_smu_metrics(pdev, info);
>>> +}
>>> +EXPORT_SYMBOL_GPL(amd_pmf_get_npu_data);
>>> +
>>>    static int amd_pmf_suspend_handler(struct device *dev)
>>>    {
>>>        struct amd_pmf_dev *pdev = dev_get_drvdata(dev);
>>> @@ -431,6 +489,8 @@ static int amd_pmf_probe(struct platform_device
>>> *pdev)
>>>          dev->dev = &pdev->dev;
>>>    +    pmf = dev->dev;
>>> +
>>>        rdev = pci_get_domain_bus_and_slot(0, 0, PCI_DEVFN(0, 0));
>>>        if (!rdev || !pci_match_id(pmf_pci_ids, rdev)) {
>>>            pci_dev_put(rdev);
>>> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/
>>> x86/amd/pmf/pmf.h
>>> index 6ea5380f3b23..622404e71136 100644
>>> --- a/drivers/platform/x86/amd/pmf/pmf.h
>>> +++ b/drivers/platform/x86/amd/pmf/pmf.h
>>> @@ -12,6 +12,7 @@
>>>    #define PMF_H
>>>      #include <linux/acpi.h>
>>> +#include <linux/amd-pmf-io.h>
>>>    #include <linux/input.h>
>>>    #include <linux/platform_device.h>
>>>    #include <linux/platform_profile.h>
>>> diff --git a/include/linux/amd-pmf-io.h b/include/linux/amd-pmf-io.h
>>> index 6fa510f419c0..55198d2875cc 100644
>>> --- a/include/linux/amd-pmf-io.h
>>> +++ b/include/linux/amd-pmf-io.h
>>> @@ -61,5 +61,26 @@ enum laptop_placement {
>>>        LP_UNDEFINED,
>>>    };
>>>    +/**
>>> + * struct amd_pmf_npu_metrics: Get NPU metrics data from PMF driver
>>> + * @npuclk_freq: NPU clock frequency [MHz]
>>> + * @npu_busy: NPU busy % [0-100]
>>> + * @npu_power: NPU power [mW]
>>> + * @mpnpuclk_freq: MPNPU [MHz]
>>> + * @npu_reads: NPU read bandwidth [MB/sec]
>>> + * @npu_writes: NPU write bandwidth [MB/sec]
>>> + */
>>> +struct amd_pmf_npu_metrics {
>>> +    u16 npuclk_freq;
>>> +    u16 npu_busy[8];
>>
>> This 8 comes from there being 8 columns, right?  What happens when we
>> have a product with more?  It seems like this doesn't scale well
>> outside of that design.
>>
>> I know it is a simple memcpy() right now and the structure resembles
>> the firmware structure, but would it make sense for inter-kernel
>> commnication to define a different structure that would remain stable
>> no matter how many columns?
>>
>> Something like this:
>>
>> struct amd_pmf_npu_metrics {
>>      u16 npuclk_freq;
>>      u16 npu_power;
>>      u16 mpnpuclk_freq;
>>      u16 npu_reads;
>>      u16 npu_writes;
>>      u8 npu_columns;
>>      u16 *npu_busy;
>> };
>>
>> The size of npu_busy could be allocated dynamically, but this would
>> also mean putting the responsibility of freeing it on the caller.
>>
>> The alternative is of course a amd_pmf_npu_metrics_v2 if/when that
>> happens.
>>
> 
> I can give it a shot. But I presume structure changes would not be
> more frequent. So, I would still lean to having a _v2/_v3 whenever
> that happens in the future.
> 

Yeah if it's not going to be a frequent update, it might not be worth 
the extra complexity.  You can make a decision here, and if you want to 
stick with what you've got that is fine.

> Thanks,
> Shyam
> 
> 
>> I just thought it was worth considering right now.
>>> +    u16 npu_power;
>>> +    u16 mpnpuclk_freq;
>>> +    u16 npu_reads;
>>> +    u16 npu_writes;
>>> +};
>>> +
>>>    int amd_get_sfh_info(struct amd_sfh_info *sfh_info, enum
>>> sfh_message_type op);
>>> +
>>> +/* AMD PMF and NPU interface */
>>> +int amd_pmf_get_npu_data(struct amd_pmf_npu_metrics *info);
>>>    #endif
>>
> 

