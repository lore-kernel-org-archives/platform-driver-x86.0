From: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH 04/11] vga_switcheroo: Allow stashing of panel data
Date: Tue, 03 Jun 2014 16:40:36 +0300
Message-ID: <87d2eqf6wb.fsf@intel.com>
References: <1401640723-2058-1-git-send-email-matthew.garrett@nebula.com> <1401640723-2058-5-git-send-email-matthew.garrett@nebula.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:4857 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753135AbaFCNkj (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 3 Jun 2014 09:40:39 -0400
In-Reply-To: <1401640723-2058-5-git-send-email-matthew.garrett@nebula.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: airlied@gmail.com
Cc: Matthew Garrett <matthew.garrett@nebula.com>, dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org

On Sun, 01 Jun 2014, Matthew Garrett <matthew.garrett@nebula.com> wrote:
> Not all MUXes allow us to connect the panel data channel to a GPU without
> handing over the entire panel and triggering additional flickering during
> boot. We only need to do this in order to probe for data that the first
> GPU driver has already identified, so add some functions for stashing that
> data in vga_switcheroo where it can be retrieved by the other driver later.
>
> Signed-off-by: Matthew Garrett <matthew.garrett@nebula.com>
> ---
>  drivers/gpu/vga/vga_switcheroo.c | 59 ++++++++++++++++++++++++++++++++++++++++
>  include/linux/vga_switcheroo.h   | 12 ++++++++
>  2 files changed, 71 insertions(+)
>
> diff --git a/drivers/gpu/vga/vga_switcheroo.c b/drivers/gpu/vga/vga_switcheroo.c
> index 6d95626..1a80b93 100644
> --- a/drivers/gpu/vga/vga_switcheroo.c
> +++ b/drivers/gpu/vga/vga_switcheroo.c
> @@ -17,6 +17,8 @@
>   - switch_check  - check if the device is in a position to switch now
>   */
>  
> +#include <drm/drm_edid.h>
> +
>  #include <linux/module.h>
>  #include <linux/seq_file.h>
>  #include <linux/uaccess.h>
> @@ -39,6 +41,7 @@ struct vga_switcheroo_client {
>  	int id;
>  	bool active;
>  	bool driver_power_control;
> +	bool use_panel;
>  	struct list_head list;
>  };
>  
> @@ -56,6 +59,9 @@ struct vgasr_priv {
>  	int registered_clients;
>  	struct list_head clients;
>  
> +	struct edid *edid;
> +	u8 *dpcd;
> +
>  	struct vga_switcheroo_handler *handler;
>  };
>  
> @@ -107,7 +113,9 @@ static void vga_switcheroo_enable(void)
>  				VGA_SWITCHEROO_DIS : VGA_SWITCHEROO_IGD;
>  			if (vgasr_priv.handler->switch_ddc)
>  				vgasr_priv.handler->switch_ddc(client->id);
> +			client->use_panel = true;
>  			client->ops->reprobe_connectors(client->pdev);
> +			client->use_panel = false;
>  			if (vgasr_priv.handler->switch_ddc)
>  				vgasr_priv.handler->switch_ddc(old_id);
>  		}
> @@ -412,6 +420,9 @@ static int vga_switchto_stage2(struct vga_switcheroo_client *new_client)
>  	if (ret)
>  		goto restore_ddc;
>  
> +	new_client->use_panel = true;
> +	active->use_panel = false;
> +
>  	if (new_client->ops->reprobe)
>  		new_client->ops->reprobe(new_client->pdev);
>  
> @@ -766,6 +777,54 @@ int vga_switcheroo_init_domain_pm_optimus_hdmi_audio(struct device *dev, struct
>  }
>  EXPORT_SYMBOL(vga_switcheroo_init_domain_pm_optimus_hdmi_audio);
>  
> +int vga_switcheroo_set_dpcd(u8 *dpcd)

Quite a few DPCD related things in drm_dp_helper.h expect
DP_RECEIVER_CAP_SIZE bytes of DPCD. Might be helpful to conform to that.

Can also be made const u8 *.

> +{
> +	if (vgasr_priv.dpcd)
> +		return -EEXIST;
> +
> +	vgasr_priv.dpcd = kmalloc(8, GFP_KERNEL);
> +	memcpy(vgasr_priv.dpcd, dpcd, 8);

kmemdup.

> +	return 0;
> +}
> +EXPORT_SYMBOL(vga_switcheroo_set_dpcd);
> +
> +u8 *vga_switcheroo_get_dpcd(struct pci_dev *pdev)
> +{
> +	struct vga_switcheroo_client *client;
> +	client = find_client_from_pci(&vgasr_priv.clients, pdev);
> +
> +	if (!client || !client->use_panel)
> +		return NULL;
> +
> +	return vgasr_priv.dpcd;
> +}
> +EXPORT_SYMBOL(vga_switcheroo_get_dpcd);
> +
> +int vga_switcheroo_set_edid(struct edid *edid)
> +{
> +	int size = EDID_LENGTH * (1 + edid->extensions);
> +
> +	if (vgasr_priv.edid)
> +		return -EEXIST;
> +
> +	vgasr_priv.edid = kmalloc(size, GFP_KERNEL);
> +	memcpy(vgasr_priv.edid, edid, size);

kmemdup.

BR,
Jani.

> +	return 0;
> +}
> +EXPORT_SYMBOL(vga_switcheroo_set_edid);
> +
> +struct edid *vga_switcheroo_get_edid(struct pci_dev *pdev)
> +{
> +	struct vga_switcheroo_client *client;
> +	client = find_client_from_pci(&vgasr_priv.clients, pdev);
> +
> +	if (!client || !client->use_panel)
> +		return NULL;
> +
> +	return vgasr_priv.edid;
> +}
> +EXPORT_SYMBOL(vga_switcheroo_get_edid);
> +
>  static int __init vga_switcheroo_setup(char *str)
>  {
>  	if (!strcmp(str, "IGD"))
> diff --git a/include/linux/vga_switcheroo.h b/include/linux/vga_switcheroo.h
> index bae62fd..07b07fc 100644
> --- a/include/linux/vga_switcheroo.h
> +++ b/include/linux/vga_switcheroo.h
> @@ -10,6 +10,7 @@
>  #ifndef _LINUX_VGA_SWITCHEROO_H_
>  #define _LINUX_VGA_SWITCHEROO_H_
>  
> +#include <drm/drm_edid.h>
>  #include <linux/fb.h>
>  
>  struct pci_dev;
> @@ -69,6 +70,12 @@ void vga_switcheroo_set_dynamic_switch(struct pci_dev *pdev, enum vga_switcheroo
>  
>  int vga_switcheroo_init_domain_pm_ops(struct device *dev, struct dev_pm_domain *domain);
>  int vga_switcheroo_init_domain_pm_optimus_hdmi_audio(struct device *dev, struct dev_pm_domain *domain);
> +
> +int vga_switcheroo_set_dpcd(u8 *dpcd);
> +u8 *vga_switcheroo_get_dpcd(struct pci_dev *pdev);
> +int vga_switcheroo_set_edid(struct edid *edid);
> +struct edid *vga_switcheroo_get_edid(struct pci_dev *pdev);
> +
>  #else
>  
>  static inline void vga_switcheroo_unregister_client(struct pci_dev *dev) {}
> @@ -89,5 +96,10 @@ static inline void vga_switcheroo_set_dynamic_switch(struct pci_dev *pdev, enum
>  static inline int vga_switcheroo_init_domain_pm_ops(struct device *dev, struct dev_pm_domain *domain) { return -EINVAL; }
>  static inline int vga_switcheroo_init_domain_pm_optimus_hdmi_audio(struct device *dev, struct dev_pm_domain *domain) { return -EINVAL; }
>  
> +static inline int vga_switcheroo_set_dpcd(u8 *dpcd) { return 0 };
> +static inline u8 *vga_switcheroo_get_dpcd(struct pci_dev *pdev) { return NULL };
> +static inline int vga_switcheroo_set_edid(struct edid *edid) { return 0 };
> +static inline struct edid *vga_switcheroo_get_edid(struct pci_dev *pdev) { return NULL };
> +
>  #endif
>  #endif /* _LINUX_VGA_SWITCHEROO_H_ */
> -- 
> 1.8.5.3
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Jani Nikula, Intel Open Source Technology Center
