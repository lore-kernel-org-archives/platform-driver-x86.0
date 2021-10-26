Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 025EEC433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue, 26 Oct 2021 21:14:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C601E60F6F
	for <platform-driver-x86@archiver.kernel.org>; Tue, 26 Oct 2021 21:14:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235968AbhJZVQf (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 26 Oct 2021 17:16:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239455AbhJZVQb (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 26 Oct 2021 17:16:31 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AADDEC061570
        for <platform-driver-x86@vger.kernel.org>; Tue, 26 Oct 2021 14:14:04 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id r4so1835896edi.5
        for <platform-driver-x86@vger.kernel.org>; Tue, 26 Oct 2021 14:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=XDmAxOOX6gLXJJJZwcR/f2qM9WP0y0LgJ2ecSTltuJs=;
        b=AFjhCub7vW6G4iw9RVDk7Tb5ISrD9WF3bea3LzBho3vrxopjlqK0ihLVPriQ7PGykD
         D/G3Ln7719U0AkkluCP/M6xPw5MgJR8nHU36qNYJWDIGwkc2/OxllVnfyoNyk6SS8MdL
         TDUMuhaK4NuREZEBC+STJLtCi3aPNFiciXTbZkeueXlnL3S4UC8v8ik1DJIoX4La5egL
         L9yUTfzV5MJWP5aYAglDar8+HJUXpJ04uHNrTMz0VaQbdMqjiFTtrmHuztM52qWz7bQ6
         l6Nlb5O738B3DdhcM1CoD3vLO8VFJObXU5pST8Oj0GET/MqW8fuDwIELb7t6US2QKj8N
         iuyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=XDmAxOOX6gLXJJJZwcR/f2qM9WP0y0LgJ2ecSTltuJs=;
        b=oIc/AjtvGVmgFwSGFvvjHWEpndCs/UQuCBSAMNOZLC7MRXPGEoVdDAUkW74dNlmDgs
         aHckGlqt3wfBRNSqcJCfKmyY7V3SKAmVKnfPco4m895W0ANNoCBGQmoWDUUdzCzaRrxn
         y0AEg5yABLmJlQIgko06wcFwECtQwrUostBnJz+g9BMWLH31vj40bfS0us5NdiChVHy2
         vo1RQYWkp3gRr2x4Y8+ITbJIWu7L/MvVUslbTcagHyzaqrzk38359Pb1W5r2a7IW2YyS
         8sUhP8U11q7blW3esJd7e8kAhew5hv8R5JNk2F5lj/1iseYDxes9qvDGZVTsO3VA6+HG
         IRcg==
X-Gm-Message-State: AOAM532PihReMZ0JSW87jMMdLjvBCqFYQx2jYLYFNpIL5viBn8QfEcB8
        1813zpbux7Kx+7qu//JXP/gE+RSCJrZWr3holmM=
X-Google-Smtp-Source: ABdhPJy/oH3FYtdCC2TJD+GC6w1kq6sLrgUs+lJyVuAmzoDlqXBH8UfvbR2DI8IfYn8RwNtVmP0HUPspAgMOlh5s16E=
X-Received: by 2002:a17:906:369a:: with SMTP id a26mr33274898ejc.539.1635282843145;
 Tue, 26 Oct 2021 14:14:03 -0700 (PDT)
MIME-Version: 1.0
References: <20211026184045.2201-1-Sanket.Goswami@amd.com> <20211026184045.2201-4-Sanket.Goswami@amd.com>
 <BN8PR12MB3508437615126E2E6F93F1959C849@BN8PR12MB3508.namprd12.prod.outlook.com>
In-Reply-To: <BN8PR12MB3508437615126E2E6F93F1959C849@BN8PR12MB3508.namprd12.prod.outlook.com>
From:   Scott Bruce <smbruce@gmail.com>
Date:   Tue, 26 Oct 2021 14:13:51 -0700
Message-ID: <CAPOoXdGFVyTbu5Qkp6W762=g1QD3F4yVXP8FUBEOnCHSui+19A@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] platform/x86: amd-pmc: Add support for AMD Smart
 Trace Buffer
To:     "Goswami, Sanket" <Sanket.Goswami@amd.com>
Cc:     "S-k, Shyam-sundar" <Shyam-sundar.S-k@amd.com>,
        "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "mgross@linux.intel.com" <mgross@linux.intel.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Tested-by: Scott Bruce <smbruce@gmail.com>

On Tue, Oct 26, 2021 at 11:57 AM Goswami, Sanket <Sanket.Goswami@amd.com> w=
rote:
>
> [AMD Official Use Only]
>
> +Scott
>
> -----Original Message-----
> From: Goswami, Sanket <Sanket.Goswami@amd.com>
> Sent: Wednesday, October 27, 2021 0:11
> To: S-k, Shyam-sundar <Shyam-sundar.S-k@amd.com>; hdegoede@redhat.com; mg=
ross@linux.intel.com
> Cc: platform-driver-x86@vger.kernel.org; Goswami, Sanket <Sanket.Goswami@=
amd.com>
> Subject: [PATCH v4 3/3] platform/x86: amd-pmc: Add support for AMD Smart =
Trace Buffer
>
> STB (Smart Trace Buffer), is a debug trace buffer which is used to help i=
solate failures by analyzing the last feature that a system was running bef=
ore hitting a failure. This nonintrusive way is always running in the backg=
round and trace is stored into the SoC.
>
> This patch provides mechanism to access the STB buffer using the read and=
 write routines.
>
> Co-developed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> ---
> Changes in v4:
> - Use kzalloc() for memory allocation.
>
> Changes in v3:
> - Address review comments from Mark Gross.
>
> Changes in v2:
> - Create amd_pmc_stb_debugfs_fops structure to get STB data.
> - Address review comments from Hans.
>
>  drivers/platform/x86/amd-pmc.c | 122 +++++++++++++++++++++++++++++++++
>  1 file changed, 122 insertions(+)
>
> diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pm=
c.c index 50cb65e38d11..e55c48f675e1 100644
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
>  /* Base address of SMU for mapping physical address to virtual address *=
/
>  #define AMD_PMC_SMU_INDEX_ADDRESS      0xB8
>  #define AMD_PMC_SMU_INDEX_DATA         0xBC
> @@ -82,6 +88,7 @@
>  #define SOC_SUBSYSTEM_IP_MAX   12
>  #define DELAY_MIN_US           2000
>  #define DELAY_MAX_US           3000
> +#define FIFO_SIZE              4096
>  enum amd_pmc_def {
>         MSG_TEST =3D 0x01,
>         MSG_OS_HINT_PCO,
> @@ -128,8 +135,14 @@ struct amd_pmc_dev {  #endif /* CONFIG_DEBUG_FS */  =
};
>
> +static bool enable_stb;
> +module_param(enable_stb, bool, 0644);
> +MODULE_PARM_DESC(enable_stb, "Enable the STB debug mechanism");
> +
>  static struct amd_pmc_dev pmc;
>  static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data,=
 u8 msg, bool ret);
> +static int amd_pmc_write_stb(struct amd_pmc_dev *dev, u32 data); static
> +int amd_pmc_read_stb(struct amd_pmc_dev *dev, u32 *buf);
>
>  static inline u32 amd_pmc_reg_read(struct amd_pmc_dev *dev, int reg_offs=
et)  { @@ -176,6 +189,53 @@ static int amd_pmc_get_smu_version(struct amd_p=
mc_dev *dev)
>         return 0;
>  }
>
> +static int amd_pmc_stb_debugfs_open(struct inode *inode, struct file
> +*filp) {
> +       struct amd_pmc_dev *dev =3D filp->f_inode->i_private;
> +       u32 size =3D FIFO_SIZE * sizeof(u32);
> +       u32 *buf;
> +       int rc;
> +
> +       buf =3D kzalloc(size, GFP_KERNEL);
> +       if (!buf)
> +               return -ENOMEM;
> +
> +       rc =3D amd_pmc_read_stb(dev, buf);
> +       if (rc)
> +               goto out;
> +
> +       filp->private_data =3D buf;
> +
> +out:
> +       kfree(buf);
> +       return rc;
> +}
> +
> +static ssize_t amd_pmc_stb_debugfs_read(struct file *filp, char __user *=
buf, size_t size,
> +                                       loff_t *pos)
> +{
> +       if (!filp->private_data)
> +               return -EINVAL;
> +
> +       return simple_read_from_buffer(buf, size, pos, filp->private_data=
,
> +                                      FIFO_SIZE * sizeof(u32));
> +}
> +
> +static int amd_pmc_stb_debugfs_release(struct inode *inode, struct file
> +*filp) {
> +       kfree(filp->private_data);
> +       filp->private_data =3D NULL;
> +
> +       return 0;
> +}
> +
> +const struct file_operations amd_pmc_stb_debugfs_fops =3D {
> +       .owner =3D THIS_MODULE,
> +       .open =3D amd_pmc_stb_debugfs_open,
> +       .read =3D amd_pmc_stb_debugfs_read,
> +       .release =3D amd_pmc_stb_debugfs_release, };
> +
>  static int amd_pmc_idlemask_read(struct amd_pmc_dev *pdev, struct device=
 *dev,
>                                  struct seq_file *s)
>  {
> @@ -289,6 +349,10 @@ static void amd_pmc_dbgfs_register(struct amd_pmc_de=
v *dev)
>                             &s0ix_stats_fops);
>         debugfs_create_file("amd_pmc_idlemask", 0644, dev->dbgfs_dir, dev=
,
>                             &amd_pmc_idlemask_fops);
> +       /* Enable STB only when the module_param is set */
> +       if (enable_stb)
> +               debugfs_create_file("stb_read", 0644, dev->dbgfs_dir, dev=
,
> +                                   &amd_pmc_stb_debugfs_fops);
>  }
>  #else
>  static inline void amd_pmc_dbgfs_register(struct amd_pmc_dev *dev) @@ -4=
88,6 +552,9 @@ static int __maybe_unused amd_pmc_suspend(struct device *dev=
)
>         if (rc)
>                 dev_err(pdev->dev, "suspend failed\n");
>
> +       if (enable_stb)
> +               amd_pmc_write_stb(pdev, AMD_PMC_STB_PREDEF);
> +
>         return rc;
>  }
>
> @@ -508,6 +575,10 @@ static int __maybe_unused amd_pmc_resume(struct devi=
ce *dev)
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
> @@ -524,6 +595,57 @@ static const struct pci_device_id pmc_pci_ids[] =3D =
{
>         { }
>  };
>
> +static int amd_pmc_write_stb(struct amd_pmc_dev *dev, u32 data) {
> +       int rc;
> +
> +       rc =3D pci_write_config_dword(dev->rdev, AMD_PMC_STB_INDEX_ADDRES=
S, AMD_PMC_STB_PMI_0);
> +       if (rc) {
> +               dev_err(dev->dev, "failed to write addr in stb: 0x%X\n",
> +                       AMD_PMC_STB_INDEX_ADDRESS);
> +               pci_dev_put(dev->rdev);
> +               return pcibios_err_to_errno(rc);
> +       }
> +
> +       rc =3D pci_write_config_dword(dev->rdev, AMD_PMC_STB_INDEX_DATA, =
data);
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
> +static int amd_pmc_read_stb(struct amd_pmc_dev *dev, u32 *buf) {
> +       int i, err;
> +       u32 value;
> +
> +       err =3D pci_write_config_dword(dev->rdev, AMD_PMC_STB_INDEX_ADDRE=
SS, AMD_PMC_STB_PMI_0);
> +       if (err) {
> +               dev_err(dev->dev, "error writing addr to stb: 0x%X\n",
> +                       AMD_PMC_STB_INDEX_ADDRESS);
> +               pci_dev_put(dev->rdev);
> +               return pcibios_err_to_errno(err);
> +       }
> +
> +       for (i =3D 0; i < FIFO_SIZE; i++) {
> +               err =3D pci_read_config_dword(dev->rdev, AMD_PMC_STB_INDE=
X_DATA, &value);
> +               if (err) {
> +                       dev_err(dev->dev, "error reading data from stb: 0=
x%X\n",
> +                               AMD_PMC_STB_INDEX_DATA);
> +                       pci_dev_put(dev->rdev);
> +                       return pcibios_err_to_errno(err);
> +               }
> +
> +               *buf++ =3D value;
> +       }
> +
> +       return 0;
> +}
> +
>  static int amd_pmc_probe(struct platform_device *pdev)  {
>         struct amd_pmc_dev *dev =3D &pmc;
> --
> 2.25.1
