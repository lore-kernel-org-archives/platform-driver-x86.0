From: Axel Lin <axel.lin@gmail.com>
Subject: Re: [PATCH] platform-drivers-x86: convert drivers/platform/x86/* to
 use module_platform_driver()
Date: Mon, 28 Nov 2011 13:44:43 +0800
Message-ID: <CAF+7xWnmce=F97Txc+SENzQxzdQdLKHyf619W46Yg1j9HAj_aw@mail.gmail.com>
References: <1322280877.6458.3.camel@phoenix> <D6D887BA8C9DFF48B5233887EF04654109F12EC332@bgsmsx502.gar.corp.intel.com>
Reply-To: axel.lin@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <D6D887BA8C9DFF48B5233887EF04654109F12EC332@bgsmsx502.gar.corp.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "R, Durgadoss" <durgadoss.r@intel.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Liu, Hong" <hong.liu@intel.com>, Daniel Drake <dsd@laptop.org>, Matthew Garrett <mjg@redhat.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

2011/11/28 R, Durgadoss <durgadoss.r@intel.com>:
> Hi,
>
> Thanks for the nice clean up for intel_mid_thermal.c
>
> From which kernel version is this new macro supported ?
>
module_platform_driver() is already in current Linus's tree ( linux-3.2 rcX)
Regards,
Axel
