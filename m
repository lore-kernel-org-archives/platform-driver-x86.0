From: Darren Hart <dvhart@infradead.org>
Subject: Re: [patch v9 4/4] platform/mellanox: mlxreg-hotplug: Modify to use
 a regmap interface
Date: Mon, 22 Jan 2018 19:51:24 -0800
Message-ID: <20180123035124.GB24956@fury>
References: <1516213316-32278-1-git-send-email-vadimp@mellanox.com>
 <1516213316-32278-5-git-send-email-vadimp@mellanox.com>
 <20180123034946.GA24956@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180123034946.GA24956@fury>
Sender: linux-kernel-owner@vger.kernel.org
To: Vadim Pasternak <vadimp@mellanox.com>
Cc: andy.shevchenko@gmail.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, jiri@resnulli.us
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Jan 22, 2018 at 07:49:46PM -0800, Darren Hart wrote:
> On Wed, Jan 17, 2018 at 06:21:56PM +0000, Vadim Pasternak wrote:
> > +#define MLXREG_CORE_LABEL_MAX_SIZE	32
> > +
> >  /**
> >   * struct mlxreg_hotplug_device - I2C device data:
> > + *
> >   * @adapter: I2C device adapter;
> >   * @client: I2C device client;
> >   * @brdinfo: device board information;
> >   * @nr: I2C device adapter number, to which device is to be attached;
> > - * @np - pointer to node platform associated with attribute;
> 
> We just added this in 3/4. This should have just been skipped and done as it is
> here directly, and only enabling ARM support at the end.

Apologies, I was still working on this email when I accidentally sent it instead
of postponing it. The above is true, but I'm working on fixing it in my branch.

No need to resend at this point.

-- 
Darren Hart
VMware Open Source Technology Center
