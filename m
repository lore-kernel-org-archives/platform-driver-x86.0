Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B947C433F5
	for <platform-driver-x86@archiver.kernel.org>; Fri, 29 Oct 2021 23:27:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3614560FDA
	for <platform-driver-x86@archiver.kernel.org>; Fri, 29 Oct 2021 23:27:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231515AbhJ2X3l (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 29 Oct 2021 19:29:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbhJ2X3l (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 29 Oct 2021 19:29:41 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7D8CC061570
        for <platform-driver-x86@vger.kernel.org>; Fri, 29 Oct 2021 16:27:11 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id g8so43945857edb.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 29 Oct 2021 16:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mIm84cFJazxUAkQes9gQxq9Y1aBH1VgaE2Z9OmR2+i8=;
        b=EvJKExgJVnkgjxXsMO2vOrEmRGUOLhjMN7x27AkgaGlAEZMooWd1xlf47mKKKJx6E7
         eHLsra29cL86DQIFft3o5IQAiH3yNnFBRZ7IOt41eUV/ClVnpSl5gwXgRiBLaQL8hpBf
         pgVG9WYigbqb0qHfYPB6kqazw64B3y06Kyk112t5dTWgve0IBBydY5paJhfxgcqSMmUE
         IS8EdZ8g6p7uV6GWWTYM//c6Qem56c+k//KOpn6JwNxtwsSOyUzjJ9/iWb54RyDh92bl
         RLaszpLLLx+Rafuw2wc8rPhUgbybYVEg3ocm0ryWulig/XAmb401C+w+9HTeesJ8KR2r
         cJpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mIm84cFJazxUAkQes9gQxq9Y1aBH1VgaE2Z9OmR2+i8=;
        b=pB7iU3xzXTHE4RXiGS9h/YDM2s491eaC7LmVSxyVwitNqe8V1s5+EPWNqqe6LZUORv
         e7uGkWEyoH4kgng4R5Fd3sRM45ytYvf13MRBN+qGwyfAursXboSCNBjMVP+/IdSBtdB0
         obwy6H67EY+BqODJvCQbC5bPKHVI3+Q4OffNF5rurmBuEksfcQbyYE3fMkXLcA8KC56+
         FGN3NGHViV6c0/4hUuhp1dtqRvj/zTxrG3HA3XqJe1tiywQOk0zTvnzkUCmG1r0u7QHv
         +KiUHPVN1hGxps//aJ0qP8s/V6qKY5/i9NHBD699eSkGbC4wK7qTVBX5N769r/43j/I7
         GNbg==
X-Gm-Message-State: AOAM532/OpWygL0JwasjxAPeN6aAl6cBBQqP9U1bOBep546UMfUnkY7n
        RPSdahfsZZxGDduPSE6QNL+eqGVenr8Iw+Xmsxi1q8mXSes=
X-Google-Smtp-Source: ABdhPJyd6jmYGaOn8jN6RbuS5wdwmDD7WEuen5reuqE8wwgAMsAOBPCNvbYKUElH73yiGfqdK9dqKso5P+/Akz/SK0k=
X-Received: by 2002:a17:907:c0c:: with SMTP id ga12mr17826618ejc.475.1635550030416;
 Fri, 29 Oct 2021 16:27:10 -0700 (PDT)
MIME-Version: 1.0
References: <20211029172304.2998-1-Sanket.Goswami@amd.com> <20211029172304.2998-4-Sanket.Goswami@amd.com>
In-Reply-To: <20211029172304.2998-4-Sanket.Goswami@amd.com>
From:   Scott Bruce <smbruce@gmail.com>
Date:   Fri, 29 Oct 2021 16:26:58 -0700
Message-ID: <CAPOoXdH1F6yggLSvcPD5UWPnwKEZ5P_WUayOpw5Nzrw1mJ-JMg@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] platform/x86: amd-pmc: Add support for AMD Smart
 Trace Buffer
To:     Sanket Goswami <Sanket.Goswami@amd.com>
Cc:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hdegoede@redhat.com,
        mgross@linux.intel.com, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Tested-by: Scott Bruce <smbruce@gmail.com>

On Fri, Oct 29, 2021 at 10:25 AM Sanket Goswami <Sanket.Goswami@amd.com> wrote:
>
> STB (Smart Trace Buffer), is a debug trace buffer which is used to help
> isolate failures by analyzing the last feature that a system was running
> before hitting a failure. This nonintrusive way is always running in the
> background and trace is stored into the SoC.
>
> This patch provides mechanism to access the STB buffer using the read
> and write routines.
>
> Co-developed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> ---
> Changes in v5:
> - Use kfree() only once in .open as suggested by Hans.
>
> Changes in v4:
> - Use kzalloc() for memory allocation.
>
> Changes in v3:
> - Use sizeof(u32) with multiplier as suggested by Mark Gross.
>
> Changes in v2:
> - Create amd_pmc_stb_debugfs_fops structure to get STB data.
> - Address review comments from Hans.
>
>  drivers/platform/x86/amd-pmc.c | 127 +++++++++++++++++++++++++++++++++
>  1 file changed, 127 insertions(+)
>
> diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
> index ea099f7759f2..a39354ea96c4 100644
> --- a/drivers/platform/x86/amd-pmc.c
> +++ b/drivers/platform/x86/amd-pmc.c
> @@ -35,6 +35,12 @@
>  #define AMD_PMC_SCRATCH_REG_CZN                0x94
>  #define AMD_PMC_SCRATCH_REG_YC         0xD14
>
> +/* STB Registers */
> +#define AMD_PMC_STB_INDEX_ADDRESS      0xF8
> +#define AMD_PMC_STB_INDEX_DATA         0xFC
> +#define AMD_PMC_STB_PMI_0              0x03E30600
> +#define AMD_PMC_STB_PREDEF             0xC6000001
> +
>  /* Base address of SMU for mapping physical address to virtual address */
>  #define AMD_PMC_SMU_INDEX_ADDRESS      0xB8
>  #define AMD_PMC_SMU_INDEX_DATA         0xBC
> @@ -82,6 +88,7 @@
>  #define SOC_SUBSYSTEM_IP_MAX   12
>  #define DELAY_MIN_US           2000
>  #define DELAY_MAX_US           3000
> +#define FIFO_SIZE              4096
>  enum amd_pmc_def {
>         MSG_TEST = 0x01,
>         MSG_OS_HINT_PCO,
> @@ -128,8 +135,14 @@ struct amd_pmc_dev {
>  #endif /* CONFIG_DEBUG_FS */
>  };
>
> +static bool enable_stb;
> +module_param(enable_stb, bool, 0644);
> +MODULE_PARM_DESC(enable_stb, "Enable the STB debug mechanism");
> +
>  static struct amd_pmc_dev pmc;
>  static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg, bool ret);
> +static int amd_pmc_write_stb(struct amd_pmc_dev *dev, u32 data);
> +static int amd_pmc_read_stb(struct amd_pmc_dev *dev, u32 *buf);
>
>  static inline u32 amd_pmc_reg_read(struct amd_pmc_dev *dev, int reg_offset)
>  {
> @@ -176,6 +189,50 @@ static int amd_pmc_get_smu_version(struct amd_pmc_dev *dev)
>         return 0;
>  }
>
> +static int amd_pmc_stb_debugfs_open(struct inode *inode, struct file *filp)
> +{
> +       struct amd_pmc_dev *dev = filp->f_inode->i_private;
> +       u32 size = FIFO_SIZE * sizeof(u32);
> +       u32 *buf;
> +       int rc;
> +
> +       buf = kzalloc(size, GFP_KERNEL);
> +       if (!buf)
> +               return -ENOMEM;
> +
> +       rc = amd_pmc_read_stb(dev, buf);
> +       if (rc) {
> +               kfree(buf);
> +               return rc;
> +       }
> +
> +       filp->private_data = buf;
> +       return rc;
> +}
> +
> +static ssize_t amd_pmc_stb_debugfs_read(struct file *filp, char __user *buf, size_t size,
> +                                       loff_t *pos)
> +{
> +       if (!filp->private_data)
> +               return -EINVAL;
> +
> +       return simple_read_from_buffer(buf, size, pos, filp->private_data,
> +                                      FIFO_SIZE * sizeof(u32));
> +}
> +
> +static int amd_pmc_stb_debugfs_release(struct inode *inode, struct file *filp)
> +{
> +       kfree(filp->private_data);
> +       return 0;
> +}
> +
> +const struct file_operations amd_pmc_stb_debugfs_fops = {
> +       .owner = THIS_MODULE,
> +       .open = amd_pmc_stb_debugfs_open,
> +       .read = amd_pmc_stb_debugfs_read,
> +       .release = amd_pmc_stb_debugfs_release,
> +};
> +
>  static int amd_pmc_idlemask_read(struct amd_pmc_dev *pdev, struct device *dev,
>                                  struct seq_file *s)
>  {
> @@ -289,6 +346,10 @@ static void amd_pmc_dbgfs_register(struct amd_pmc_dev *dev)
>                             &s0ix_stats_fops);
>         debugfs_create_file("amd_pmc_idlemask", 0644, dev->dbgfs_dir, dev,
>                             &amd_pmc_idlemask_fops);
> +       /* Enable STB only when the module_param is set */
> +       if (enable_stb)
> +               debugfs_create_file("stb_read", 0644, dev->dbgfs_dir, dev,
> +                                   &amd_pmc_stb_debugfs_fops);
>  }
>  #else
>  static inline void amd_pmc_dbgfs_register(struct amd_pmc_dev *dev)
> @@ -485,6 +546,9 @@ static int __maybe_unused amd_pmc_suspend(struct device *dev)
>         if (rc)
>                 dev_err(pdev->dev, "suspend failed\n");
>
> +       if (enable_stb)
> +               amd_pmc_write_stb(pdev, AMD_PMC_STB_PREDEF);
> +
>         return rc;
>  }
>
> @@ -505,6 +569,10 @@ static int __maybe_unused amd_pmc_resume(struct device *dev)
>         /* Dump the IdleMask to see the blockers */
>         amd_pmc_idlemask_read(pdev, dev, NULL);
>
> +       /* Write data incremented by 1 to distinguish in stb_read */
> +       if (enable_stb)
> +               amd_pmc_write_stb(pdev, AMD_PMC_STB_PREDEF + 1);
> +
>         return 0;
>  }
>
> @@ -521,6 +589,65 @@ static const struct pci_device_id pmc_pci_ids[] = {
>         { }
>  };
>
> +static int amd_pmc_write_stb(struct amd_pmc_dev *dev, u32 data)
> +{
> +       int err;
> +
> +       err = pci_write_config_dword(dev->rdev, AMD_PMC_STB_INDEX_ADDRESS, AMD_PMC_STB_PMI_0);
> +       if (err) {
> +               dev_err(dev->dev, "failed to write addr in stb: 0x%X\n",
> +                       AMD_PMC_STB_INDEX_ADDRESS);
> +               err = pcibios_err_to_errno(err);
> +               goto err_pci_dev_put;
> +       }
> +
> +       err = pci_write_config_dword(dev->rdev, AMD_PMC_STB_INDEX_DATA, data);
> +       if (err) {
> +               dev_err(dev->dev, "failed to write data in stb: 0x%X\n",
> +                       AMD_PMC_STB_INDEX_DATA);
> +               err = pcibios_err_to_errno(err);
> +               goto err_pci_dev_put;
> +       }
> +
> +       return 0;
> +
> +err_pci_dev_put:
> +       pci_dev_put(dev->rdev);
> +       return err;
> +}
> +
> +static int amd_pmc_read_stb(struct amd_pmc_dev *dev, u32 *buf)
> +{
> +       int i, err;
> +       u32 value;
> +
> +       err = pci_write_config_dword(dev->rdev, AMD_PMC_STB_INDEX_ADDRESS, AMD_PMC_STB_PMI_0);
> +       if (err) {
> +               dev_err(dev->dev, "error writing addr to stb: 0x%X\n",
> +                       AMD_PMC_STB_INDEX_ADDRESS);
> +               err = pcibios_err_to_errno(err);
> +               goto err_pci_dev_put;
> +       }
> +
> +       for (i = 0; i < FIFO_SIZE; i++) {
> +               err = pci_read_config_dword(dev->rdev, AMD_PMC_STB_INDEX_DATA, &value);
> +               if (err) {
> +                       dev_err(dev->dev, "error reading data from stb: 0x%X\n",
> +                               AMD_PMC_STB_INDEX_DATA);
> +                       err = pcibios_err_to_errno(err);
> +                       goto err_pci_dev_put;
> +               }
> +
> +               *buf++ = value;
> +       }
> +
> +       return 0;
> +
> +err_pci_dev_put:
> +       pci_dev_put(dev->rdev);
> +       return err;
> +}
> +
>  static int amd_pmc_probe(struct platform_device *pdev)
>  {
>         struct amd_pmc_dev *dev = &pmc;
> --
> 2.25.1
>
