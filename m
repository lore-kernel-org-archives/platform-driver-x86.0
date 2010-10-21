From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [Patch] IBM Real-Time "SMI Free" mode driver -v7
Date: Thu, 21 Oct 2010 14:54:29 +0100
Message-ID: <20101021135429.GC22133@srcf.ucam.org>
References: <20101005224718.GC4046@lucy>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20101005224718.GC4046@lucy>
Sender: linux-doc-owner@vger.kernel.org
To: Vernon Mauery <vernux@us.ibm.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Randy Dunlap <rdunlap@xenotime.net>, Linux Documentation <linux-doc@vger.kernel.org>, Platform driver x86 <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

Applied, thanks. It'd be nice if we didn't have to rely on DMI, 
especially since enterprise customers often end up running later kernels 
- is there any other way to determine that this is safe to load? Could 
we just limit it to IBM systems in a server/blade chassis and then check 
for the _RTL_ area?

-- 
Matthew Garrett | mjg59@srcf.ucam.org
