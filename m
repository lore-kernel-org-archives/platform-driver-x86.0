Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EADBC433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue, 26 Oct 2021 11:21:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EC05D60232
	for <platform-driver-x86@archiver.kernel.org>; Tue, 26 Oct 2021 11:21:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232658AbhJZLYR (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 26 Oct 2021 07:24:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230160AbhJZLYR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 26 Oct 2021 07:24:17 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8A90C061745
        for <platform-driver-x86@vger.kernel.org>; Tue, 26 Oct 2021 04:21:53 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id y12so13174305eda.4
        for <platform-driver-x86@vger.kernel.org>; Tue, 26 Oct 2021 04:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZU/+lWJRR81Cmoazf7Nu391mwgEGZcNE5uqQhSAjNyQ=;
        b=kvd5MKqbQi17eJJrA2D4lqakf+/zMybbVBcWURWmNzuxa4GJl9XofLPGYOIETK8QJm
         aJMYUs93n1vTn1T4MYjoRehly25uXo36C1oYsrozkIOPzJQHBoZXUySZZ3nI2Xd9/0Eu
         gjsbOKuNMK/5nBQ6Ym1FCaH7pMcbZrPGmmZksLIPR/5gwji9jUOsfb3HUF655oG+iUFc
         pl8MaQn0CxP3KnNKXMbAFJ3uFjHrsXi4oeTsd6yiIVeRfO2RQvWJsYZQFgqeQv+FZ/Ga
         5kRhsK9Wh+FQdQETp87jp/+cx63ixSNeyHYSwmXqr3Xd5OfE9vKnonxpLZ7V18R677am
         chSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZU/+lWJRR81Cmoazf7Nu391mwgEGZcNE5uqQhSAjNyQ=;
        b=IF+yAs0N0L7FHW2qBKoXTJwMCQCyNZx04bAe9jDjMmO9Q5Sb/k2ObzL9WxfN02z3cB
         bJwRCifkVlQX7B6AER3JOg1PbketDedBw2MbCTp27gLglW0hn/Ps5VEJ1DMMxZWdh+Cx
         Wtw6msWS4CtY89pKD/FbEFEv+6UUKe0CI6nQRQGrinQAnH7Pqdacd+ohTB5sINCPj4z0
         UXylIGIaEpRaMxtyJUwYlrpnLADDFyoeLD3iVFuyPBDEZ+qHDHJ62zKtsXaFeXXycuKE
         ma6Ore4ZpP/Qzqh6KbqVY3OiTS8DEmcH7W/Xd1mbzIEANAzxp+1kWgag8DM0Xmv8kbBO
         5vbg==
X-Gm-Message-State: AOAM530hqDUNMrP1z0eCEdCWhThrmeAde3Hb3K9XtefkE18ISb10Rrbp
        34rBlx9zMjQWrHKfgkfntHorm9fT7E/DYLtZ5Ui0yCs2LwA=
X-Google-Smtp-Source: ABdhPJx1rEqDyj+37YAGww72UHKpOYhuRIs2Zy78GrMPbTC7JKLcdLSRI3ryanliNh3LwnoTza1+r/RjRRD35sRsRKg=
X-Received: by 2002:aa7:d54e:: with SMTP id u14mr34479530edr.2.1635247312292;
 Tue, 26 Oct 2021 04:21:52 -0700 (PDT)
MIME-Version: 1.0
References: <20211022172845.2608-1-Sanket.Goswami@amd.com> <20211022172845.2608-4-Sanket.Goswami@amd.com>
In-Reply-To: <20211022172845.2608-4-Sanket.Goswami@amd.com>
From:   Scott Bruce <smbruce@gmail.com>
Date:   Tue, 26 Oct 2021 04:21:40 -0700
Message-ID: <CAPOoXdE0vA7ygcU2UMvd1Sb9PBMhBkJ4Dv8Y8bP9jN7i+bdrRA@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] platform/x86: amd-pmc: Add support for AMD Smart
 Trace Buffer
To:     Sanket Goswami <Sanket.Goswami@amd.com>
Cc:     Shyam-sundar.S-k@amd.com, hdegoede@redhat.com,
        mgross@linux.intel.com, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

v3 of this patch hard crashes on my Cezanne laptop on the second
suspend attempt. The problem appears to be with the 3rd patch in the
series, the first two don't cause any problems.

This tree suspends fine using the original v1 and the first two
patches from the new series:
https://gitlab.com/smbruce/linux-stable-s0ix/-/commits/v5.14.14-s0ix-testing4
This crashes: https://gitlab.com/smbruce/linux-stable-s0ix/-/commits/v5.14.14-s0ix-testing3-DONTUSE

crash journal: https://gitlab.com/-/snippets/2194519

On Fri, Oct 22, 2021 at 10:31 AM Sanket Goswami <Sanket.Goswami@amd.com> wrote:
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
> Changes in v3:
> - Address review comments from Mark Gross.
>
> Changes in v2:
> - Create amd_pmc_stb_debugfs_fops structure to get STB data.
> - Address review comments from Hans.
>
>  drivers/platform/x86/amd-pmc.c | 120 +++++++++++++++++++++++++++++++++
>  1 file changed, 120 insertions(+)
>
> diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
> index 50cb65e38d11..665d57ff222d 100644
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
> @@ -176,6 +189,51 @@ static int amd_pmc_get_smu_version(struct amd_pmc_dev *dev)
>         return 0;
>  }
>
> +static int amd_pmc_stb_debugfs_open(struct inode *inode, struct file *filp)
> +{
> +       struct amd_pmc_dev *dev = filp->f_inode->i_private;
> +       u32 *buf;
> +       int rc;
> +
> +       buf = devm_kmalloc(dev->dev, FIFO_SIZE * sizeof(u32), GFP_KERNEL);
> +       if (!buf)
> +               return -ENOMEM;
> +
> +       rc = amd_pmc_read_stb(dev, buf);
> +       if (rc)
> +               goto out;
> +
> +       filp->private_data = buf;
> +
> +out:
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
> +       filp->private_data = NULL;
> +
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
> @@ -289,6 +347,10 @@ static void amd_pmc_dbgfs_register(struct amd_pmc_dev *dev)
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
> @@ -488,6 +550,9 @@ static int __maybe_unused amd_pmc_suspend(struct device *dev)
>         if (rc)
>                 dev_err(pdev->dev, "suspend failed\n");
>
> +       if (enable_stb)
> +               amd_pmc_write_stb(pdev, AMD_PMC_STB_PREDEF);
> +
>         return rc;
>  }
>
> @@ -508,6 +573,10 @@ static int __maybe_unused amd_pmc_resume(struct device *dev)
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
> @@ -524,6 +593,57 @@ static const struct pci_device_id pmc_pci_ids[] = {
>         { }
>  };
>
> +static int amd_pmc_write_stb(struct amd_pmc_dev *dev, u32 data)
> +{
> +       int rc;
> +
> +       rc = pci_write_config_dword(dev->rdev, AMD_PMC_STB_INDEX_ADDRESS, AMD_PMC_STB_PMI_0);
> +       if (rc) {
> +               dev_err(dev->dev, "failed to write addr in stb: 0x%X\n",
> +                       AMD_PMC_STB_INDEX_ADDRESS);
> +               pci_dev_put(dev->rdev);
> +               return pcibios_err_to_errno(rc);
> +       }
> +
> +       rc = pci_write_config_dword(dev->rdev, AMD_PMC_STB_INDEX_DATA, data);
> +       if (rc) {
> +               dev_err(dev->dev, "failed to write data in stb: 0x%X\n",
> +                       AMD_PMC_STB_INDEX_DATA);
> +               pci_dev_put(dev->rdev);
> +               return pcibios_err_to_errno(rc);
> +       }
> +
> +       return 0;
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
> +               pci_dev_put(dev->rdev);
> +               return pcibios_err_to_errno(err);
> +       }
> +
> +       for (i = 0; i < FIFO_SIZE; i++) {
> +               err = pci_read_config_dword(dev->rdev, AMD_PMC_STB_INDEX_DATA, &value);
> +               if (err) {
> +                       dev_err(dev->dev, "error reading data from stb: 0x%X\n",
> +                               AMD_PMC_STB_INDEX_DATA);
> +                       pci_dev_put(dev->rdev);
> +                       return pcibios_err_to_errno(err);
> +               }
> +
> +               *buf++ = value;
> +       }
> +
> +       return 0;
> +}
> +
>  static int amd_pmc_probe(struct platform_device *pdev)
>  {
>         struct amd_pmc_dev *dev = &pmc;
> --
> 2.25.1
>
