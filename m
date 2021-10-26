Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 272EAC433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue, 26 Oct 2021 12:52:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F247A60184
	for <platform-driver-x86@archiver.kernel.org>; Tue, 26 Oct 2021 12:52:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234301AbhJZMyu (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 26 Oct 2021 08:54:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55608 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233805AbhJZMyt (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 26 Oct 2021 08:54:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1635252745;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=jhxLYN2GR49bD8sPvIBkTwYB6MDzxmrooSmddCe9XVs=;
        b=NCEN8Wz0S3mz0GQjPXa6G8y4Kqn4U1Xbpl/As/C9SVJdxlA0IjQGQrtrymPbUNlzF4L08P
        da9wIp0EBnJ9rgtSG1KKeZP5NQoYqclHw/dL37fJSqDajYwT3ZDruoBgEWFlWQk8mGCY+j
        18lMmd7x/s5mBP6EROcLJTO38JXfGZs=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-404-tiyZn7_3Otqjb_zTwrg3NA-1; Tue, 26 Oct 2021 08:52:24 -0400
X-MC-Unique: tiyZn7_3Otqjb_zTwrg3NA-1
Received: by mail-ed1-f69.google.com with SMTP id y3-20020a056402358300b003dd490c775cso3696954edc.22
        for <platform-driver-x86@vger.kernel.org>; Tue, 26 Oct 2021 05:52:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=jhxLYN2GR49bD8sPvIBkTwYB6MDzxmrooSmddCe9XVs=;
        b=1iX2MRRsdfZBvUDuDiAyws+2F3FLykq8k1NNMzb+luIm87hWx87VFqzCStiizQTJRG
         TclntjZx7bUKVK8reuLvt4oieZj8heFz6mwmueNa8X3nbRTYP21XmvP9DDY8s6xjwZum
         OtMWvzjGRKVjR7CnR0tB16K0Rs9ffKbKqmHPUlQX50gF/gFR4r2Gs2EgMH4KuFR44L+x
         Dna4fHflsiJc5qHQzb0AuORh1JlTQA4W89uvQIbPeyRwhXbvDb1cmNOYUYDt+qfGhdyi
         X6xSmsNpIJ17M36b+USBjkwU7TaxpXHt4NEFQYpNZUDGtlWaBp9/Qu4YLa+71ppZ1rNa
         pRjg==
X-Gm-Message-State: AOAM530CRBEr0Z50k0BP/84vFt3axZ0axOFF7NycxQi467JpfaLPVjXU
        7yZWaE1rkAIVaV9T0DZkoaNXhsDmT7zMLJM5U3oSD0YUaQBpk+xTL1paivtXZkafyqCcNheFlGo
        QRZLwrvQbie78LRUDrxVN8aVwdKzUxppp+A==
X-Received: by 2002:a17:906:912:: with SMTP id i18mr30277699ejd.131.1635252743068;
        Tue, 26 Oct 2021 05:52:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwrTOxFyCVir1g51pYMxwYhaVZ/NccEC9PsRt32DKN1wXzsQPLuyQjel+4h3zZ8IVDekj6lqQ==
X-Received: by 2002:a17:906:912:: with SMTP id i18mr30277665ejd.131.1635252742779;
        Tue, 26 Oct 2021 05:52:22 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id hp13sm7445092ejc.66.2021.10.26.05.52.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Oct 2021 05:52:22 -0700 (PDT)
Message-ID: <31537399-332f-1013-1497-bfdf5de93c51@redhat.com>
Date:   Tue, 26 Oct 2021 14:52:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v3 3/3] platform/x86: amd-pmc: Add support for AMD Smart
 Trace Buffer
Content-Language: en-US
To:     Scott Bruce <smbruce@gmail.com>,
        Sanket Goswami <Sanket.Goswami@amd.com>
Cc:     Shyam-sundar.S-k@amd.com, mgross@linux.intel.com,
        platform-driver-x86@vger.kernel.org
References: <20211022172845.2608-1-Sanket.Goswami@amd.com>
 <20211022172845.2608-4-Sanket.Goswami@amd.com>
 <CAPOoXdE0vA7ygcU2UMvd1Sb9PBMhBkJ4Dv8Y8bP9jN7i+bdrRA@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAPOoXdE0vA7ygcU2UMvd1Sb9PBMhBkJ4Dv8Y8bP9jN7i+bdrRA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/26/21 13:21, Scott Bruce wrote:
> v3 of this patch hard crashes on my Cezanne laptop on the second
> suspend attempt. The problem appears to be with the 3rd patch in the
> series, the first two don't cause any problems.
> 
> This tree suspends fine using the original v1 and the first two
> patches from the new series:
> https://gitlab.com/smbruce/linux-stable-s0ix/-/commits/v5.14.14-s0ix-testing4
> This crashes: https://gitlab.com/smbruce/linux-stable-s0ix/-/commits/v5.14.14-s0ix-testing3-DONTUSE

Weird, I wonder what changed between v1 and v3 to cause this issue,
AFAIK there were only code cleanups.  Sanket, Shyam can you work
with Scott to resolve this ?

I'll hold of on merging this series for now then (until this is
resolved).

Regards,

Hans



> 
> crash journal: https://gitlab.com/-/snippets/2194519
> 
> On Fri, Oct 22, 2021 at 10:31 AM Sanket Goswami <Sanket.Goswami@amd.com> wrote:
>>
>> STB (Smart Trace Buffer), is a debug trace buffer which is used to help
>> isolate failures by analyzing the last feature that a system was running
>> before hitting a failure. This nonintrusive way is always running in the
>> background and trace is stored into the SoC.
>>
>> This patch provides mechanism to access the STB buffer using the read
>> and write routines.
>>
>> Co-developed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
>> ---
>> Changes in v3:
>> - Address review comments from Mark Gross.
>>
>> Changes in v2:
>> - Create amd_pmc_stb_debugfs_fops structure to get STB data.
>> - Address review comments from Hans.
>>
>>  drivers/platform/x86/amd-pmc.c | 120 +++++++++++++++++++++++++++++++++
>>  1 file changed, 120 insertions(+)
>>
>> diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
>> index 50cb65e38d11..665d57ff222d 100644
>> --- a/drivers/platform/x86/amd-pmc.c
>> +++ b/drivers/platform/x86/amd-pmc.c
>> @@ -35,6 +35,12 @@
>>  #define AMD_PMC_SCRATCH_REG_CZN                0x94
>>  #define AMD_PMC_SCRATCH_REG_YC         0xD14
>>
>> +/* STB Registers */
>> +#define AMD_PMC_STB_INDEX_ADDRESS      0xF8
>> +#define AMD_PMC_STB_INDEX_DATA         0xFC
>> +#define AMD_PMC_STB_PMI_0              0x03E30600
>> +#define AMD_PMC_STB_PREDEF             0xC6000001
>> +
>>  /* Base address of SMU for mapping physical address to virtual address */
>>  #define AMD_PMC_SMU_INDEX_ADDRESS      0xB8
>>  #define AMD_PMC_SMU_INDEX_DATA         0xBC
>> @@ -82,6 +88,7 @@
>>  #define SOC_SUBSYSTEM_IP_MAX   12
>>  #define DELAY_MIN_US           2000
>>  #define DELAY_MAX_US           3000
>> +#define FIFO_SIZE              4096
>>  enum amd_pmc_def {
>>         MSG_TEST = 0x01,
>>         MSG_OS_HINT_PCO,
>> @@ -128,8 +135,14 @@ struct amd_pmc_dev {
>>  #endif /* CONFIG_DEBUG_FS */
>>  };
>>
>> +static bool enable_stb;
>> +module_param(enable_stb, bool, 0644);
>> +MODULE_PARM_DESC(enable_stb, "Enable the STB debug mechanism");
>> +
>>  static struct amd_pmc_dev pmc;
>>  static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg, bool ret);
>> +static int amd_pmc_write_stb(struct amd_pmc_dev *dev, u32 data);
>> +static int amd_pmc_read_stb(struct amd_pmc_dev *dev, u32 *buf);
>>
>>  static inline u32 amd_pmc_reg_read(struct amd_pmc_dev *dev, int reg_offset)
>>  {
>> @@ -176,6 +189,51 @@ static int amd_pmc_get_smu_version(struct amd_pmc_dev *dev)
>>         return 0;
>>  }
>>
>> +static int amd_pmc_stb_debugfs_open(struct inode *inode, struct file *filp)
>> +{
>> +       struct amd_pmc_dev *dev = filp->f_inode->i_private;
>> +       u32 *buf;
>> +       int rc;
>> +
>> +       buf = devm_kmalloc(dev->dev, FIFO_SIZE * sizeof(u32), GFP_KERNEL);
>> +       if (!buf)
>> +               return -ENOMEM;
>> +
>> +       rc = amd_pmc_read_stb(dev, buf);
>> +       if (rc)
>> +               goto out;
>> +
>> +       filp->private_data = buf;
>> +
>> +out:
>> +       return rc;
>> +}
>> +
>> +static ssize_t amd_pmc_stb_debugfs_read(struct file *filp, char __user *buf, size_t size,
>> +                                       loff_t *pos)
>> +{
>> +       if (!filp->private_data)
>> +               return -EINVAL;
>> +
>> +       return simple_read_from_buffer(buf, size, pos, filp->private_data,
>> +                                      FIFO_SIZE * sizeof(u32));
>> +}
>> +
>> +static int amd_pmc_stb_debugfs_release(struct inode *inode, struct file *filp)
>> +{
>> +       kfree(filp->private_data);
>> +       filp->private_data = NULL;
>> +
>> +       return 0;
>> +}
>> +
>> +const struct file_operations amd_pmc_stb_debugfs_fops = {
>> +       .owner = THIS_MODULE,
>> +       .open = amd_pmc_stb_debugfs_open,
>> +       .read = amd_pmc_stb_debugfs_read,
>> +       .release = amd_pmc_stb_debugfs_release,
>> +};
>> +
>>  static int amd_pmc_idlemask_read(struct amd_pmc_dev *pdev, struct device *dev,
>>                                  struct seq_file *s)
>>  {
>> @@ -289,6 +347,10 @@ static void amd_pmc_dbgfs_register(struct amd_pmc_dev *dev)
>>                             &s0ix_stats_fops);
>>         debugfs_create_file("amd_pmc_idlemask", 0644, dev->dbgfs_dir, dev,
>>                             &amd_pmc_idlemask_fops);
>> +       /* Enable STB only when the module_param is set */
>> +       if (enable_stb)
>> +               debugfs_create_file("stb_read", 0644, dev->dbgfs_dir, dev,
>> +                                   &amd_pmc_stb_debugfs_fops);
>>  }
>>  #else
>>  static inline void amd_pmc_dbgfs_register(struct amd_pmc_dev *dev)
>> @@ -488,6 +550,9 @@ static int __maybe_unused amd_pmc_suspend(struct device *dev)
>>         if (rc)
>>                 dev_err(pdev->dev, "suspend failed\n");
>>
>> +       if (enable_stb)
>> +               amd_pmc_write_stb(pdev, AMD_PMC_STB_PREDEF);
>> +
>>         return rc;
>>  }
>>
>> @@ -508,6 +573,10 @@ static int __maybe_unused amd_pmc_resume(struct device *dev)
>>         /* Dump the IdleMask to see the blockers */
>>         amd_pmc_idlemask_read(pdev, dev, NULL);
>>
>> +       /* Write data incremented by 1 to distinguish in stb_read */
>> +       if (enable_stb)
>> +               amd_pmc_write_stb(pdev, AMD_PMC_STB_PREDEF + 1);
>> +
>>         return 0;
>>  }
>>
>> @@ -524,6 +593,57 @@ static const struct pci_device_id pmc_pci_ids[] = {
>>         { }
>>  };
>>
>> +static int amd_pmc_write_stb(struct amd_pmc_dev *dev, u32 data)
>> +{
>> +       int rc;
>> +
>> +       rc = pci_write_config_dword(dev->rdev, AMD_PMC_STB_INDEX_ADDRESS, AMD_PMC_STB_PMI_0);
>> +       if (rc) {
>> +               dev_err(dev->dev, "failed to write addr in stb: 0x%X\n",
>> +                       AMD_PMC_STB_INDEX_ADDRESS);
>> +               pci_dev_put(dev->rdev);
>> +               return pcibios_err_to_errno(rc);
>> +       }
>> +
>> +       rc = pci_write_config_dword(dev->rdev, AMD_PMC_STB_INDEX_DATA, data);
>> +       if (rc) {
>> +               dev_err(dev->dev, "failed to write data in stb: 0x%X\n",
>> +                       AMD_PMC_STB_INDEX_DATA);
>> +               pci_dev_put(dev->rdev);
>> +               return pcibios_err_to_errno(rc);
>> +       }
>> +
>> +       return 0;
>> +}
>> +
>> +static int amd_pmc_read_stb(struct amd_pmc_dev *dev, u32 *buf)
>> +{
>> +       int i, err;
>> +       u32 value;
>> +
>> +       err = pci_write_config_dword(dev->rdev, AMD_PMC_STB_INDEX_ADDRESS, AMD_PMC_STB_PMI_0);
>> +       if (err) {
>> +               dev_err(dev->dev, "error writing addr to stb: 0x%X\n",
>> +                       AMD_PMC_STB_INDEX_ADDRESS);
>> +               pci_dev_put(dev->rdev);
>> +               return pcibios_err_to_errno(err);
>> +       }
>> +
>> +       for (i = 0; i < FIFO_SIZE; i++) {
>> +               err = pci_read_config_dword(dev->rdev, AMD_PMC_STB_INDEX_DATA, &value);
>> +               if (err) {
>> +                       dev_err(dev->dev, "error reading data from stb: 0x%X\n",
>> +                               AMD_PMC_STB_INDEX_DATA);
>> +                       pci_dev_put(dev->rdev);
>> +                       return pcibios_err_to_errno(err);
>> +               }
>> +
>> +               *buf++ = value;
>> +       }
>> +
>> +       return 0;
>> +}
>> +
>>  static int amd_pmc_probe(struct platform_device *pdev)
>>  {
>>         struct amd_pmc_dev *dev = &pmc;
>> --
>> 2.25.1
>>
> 

