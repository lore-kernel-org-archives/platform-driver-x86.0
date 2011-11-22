From: Greg KH <gregkh@suse.de>
Subject: Re: [PATCH 02/15] samsung-laptop: move code into init/exit functions
Date: Tue, 22 Nov 2011 14:19:16 -0800
Message-ID: <20111122221916.GD24283@suse.de>
References: <1321999366-23784-1-git-send-email-corentincj@iksaif.net>
 <1321999366-23784-3-git-send-email-corentincj@iksaif.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1321999366-23784-3-git-send-email-corentincj@iksaif.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Corentin Chary <corentincj@iksaif.net>
Cc: platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg@redhat.com>, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Nov 22, 2011 at 11:02:33PM +0100, Corentin Chary wrote:
> Create _init()/_exit() function for each subsystem, remove
> the local struct samsung_laptop * and only keep a
> struct platform_device * that can only be used in samsung_init()
> and samsung_exit().
> 
> Signed-off-by: Corentin Chary <corentincj@iksaif.net>

It seems a little gratitous, but hey, if you want to maintain this
driver, I have no objection to you rewriting the thing :)

Acked-by: Greg Kroah-Hartman <gregkh@suse.de>
