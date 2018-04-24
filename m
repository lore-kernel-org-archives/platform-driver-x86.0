From: Henrique de Moraes Holschuh <hmh-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>
Subject: Re: ThinkPad Yoga 370 thinkpad_acpi unhandled
 events
Date: Tue, 24 Apr 2018 08:28:01 -0300
Message-ID: <20180424112801.63ojsumt34q26wor@khazad-dum.debian.net>
References: <ei0r_oTyOQrFrZKDqLMWzJHdipDsPEu8zxZxhnNuNa6L7TMRdZzu43Ldx0mcuOiRI2Ud-Lx746lfMG-9YpGR7vcp1HrsuroruKEWzhrr3dg=@protonmail.ch>
 <20180215182120.vj2evutyvixjzf55@khazad-dum.debian.net>
 <FA1DB435B97D5A4192BAE54A4EA542A99ABF1461@CNMAILEX04.lenovo.com>
 <nn6ptvhGK74etzOUiGmpuW6rNFCsoabu9zNzVxanfEx_bM47RjbdyzeThmIsNt4dxhL6-EihK-fiNvYQLB7bjuRBdu4aatirYyAc2HuDXiE=@protonmail.ch>
 <FA1DB435B97D5A4192BAE54A4EA542A99AC542CC@CNMAILEX04.lenovo.com>
 <20180403180210.v5tnefl2cvdvudfi@khazad-dum.debian.net>
 <20180409025836.ft3atn4goi4ebc4g@khazad-dum.debian.net>
 <-B_kuLAsoL7HNLV_as9l197VeKXFOu7R-GfEj_oV2TRu40VHMh4SRkEpgaOEMhEqi5-t9Qdk4c8_vMNOXDk_QHuNj-EPKs2afxrL0zTBZxc=@protonmail.ch>
 <20180420151750.bp4wy3fm6ymniool@khazad-dum.debian.net>
 <UOMPJk5MgtGjOJGKU3SU10qxnNCTWQ8WsOgGRp-Re4Xu399bCeChHc7h04F6iuW7r2yb-Z9dGaWxRXBPaJW_xUeo6TnV7d0olhz_9BHH8nA=@protonmail.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <UOMPJk5MgtGjOJGKU3SU10qxnNCTWQ8WsOgGRp-Re4Xu399bCeChHc7h04F6iuW7r2yb-Z9dGaWxRXBPaJW_xUeo6TnV7d0olhz_9BHH8nA=@protonmail.ch>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=ibm-acpi-devel>
List-Post: <mailto:ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: Darren Hart <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "bberg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org" <bberg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Christian Kellner <ckellner-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Platform Driver <platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org" <ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>, Jordan Glover <Golden_Miller83-g/b1ySJe57IkP3XJZ0H8fw@public.gmane.org>, Peter FP1 Zhang <zhangfp1-6jq1YtArVR3QT0dZR+AlfA@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, 24 Apr 2018, Jordan Glover via ibm-acpi-devel wrote:
> On April 20, 2018 5:17 PM, Henrique de Moraes Holschuh <hmh-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org> wrote:
> > I will send the (untested) patches, please test.
> 
> I tested patches on top of Linux 4.17-rc1. The warning message is gone, everything works good.

Thanks for testing!

Andy, Darren, looks like we can add Jordan's Tested-by: and schedule the
three patches for the next merge window...

Do you want me to respin the patches with the tested-by and without the
untested prefix, or can you take them directly?

-- 
  Henrique Holschuh

------------------------------------------------------------------------------
Check out the vibrant tech community on one of the world's most
engaging tech sites, Slashdot.org! http://sdm.link/slashdot
