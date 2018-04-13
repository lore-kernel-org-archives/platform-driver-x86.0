From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v1 4/7] platform: mellanox: add new ODM system types to
 mlx-platform
Date: Fri, 13 Apr 2018 09:54:33 -0700
Message-ID: <20180413165433.GF27560@fury>
References: <1522144927-56512-1-git-send-email-vadimp@mellanox.com>
 <1522144927-56512-5-git-send-email-vadimp@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1522144927-56512-5-git-send-email-vadimp@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vadim Pasternak <vadimp@mellanox.com>
Cc: andy.shevchenko@gmail.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, jiri@resnulli.us, michaelsh@mellanox.com, ivecera@redhat.com
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Mar 27, 2018 at 10:02:04AM +0000, Vadim Pasternak wrote:
> Patch adds new ODM systems, matched according to DMI_BOARD_NAME.

General nit. When writing your messages, please use the imperative (command)
form. Rather than:

"Patch adds" or "It changes" use the same form you use in the subject lines:

"Add new ODM systems", "Fix struct field documentation", etc.

Again, I've been rewriting these, but as a regular contributor, this will help
reduce the overhead of reviewing your patches - good for you, good for me :-)

> The supported ODM Ids are: VMOD0001, VMOD0002, VMOD0003, VMOD0004,
> VMOD0005. It doesn't introduce new systems, but allows to
> ODM companies to set DMI_BOARD_VENDOR and DMI_PRODUCT_NAME on
> their own. It assumes that ODM company can't change DMI_BOARD_NAME.

You said "it assumes that ODM companies can't change DMI_BOARD_NAME". Is that an
assumption, or is that how ODMs work with Mellanox?
-- 
Darren Hart
VMware Open Source Technology Center
