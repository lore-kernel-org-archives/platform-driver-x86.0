From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [patch] intel_ips: fix error handling for debugfs_create_dir()
Date: Sun, 21 Jul 2013 17:56:50 +0300
Message-ID: <20130721145650.GE5636@mwanda>
References: <20130719055144.GE9729@elgon.mountain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <kernel-janitors-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20130719055144.GE9729@elgon.mountain>
Sender: kernel-janitors-owner@vger.kernel.org
To: Matthew Garrett <matthew.garrett@nebula.com>
Cc: platform-driver-x86@vger.kernel.org, kernel-janitors@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Jul 19, 2013 at 08:51:44AM +0300, Dan Carpenter wrote:
> If debugfs is not enabled then debugfs_create_dir() returns
> ERR_PTR(-ENODEV).  Also my static checker complains that we are trying
> to print the error code, but it's is always just NULL.
> 

Sorry about this.  This patch is wrong.  Please ignore.

regards,
dan carpenter

