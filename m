From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: [PATCH] apple-gmux: Fix kconfig dependencies
Date: Mon, 23 Jul 2012 08:28:05 -0700
Message-ID: <500D6D85.4090504@xenotime.net>
References: <1341240929-3400-1-git-send-email-seth.forshee@canonical.com> <20120716235034.GB11710@ubuntu-530U> <20120723133010.GE21495@srcf.ucam.org> <20120723134427.GA3524@thinkpad-t410>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from oproxy5-pub.bluehost.com ([67.222.38.55]:49102 "HELO
	oproxy5-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1754150Ab2GWP3G (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 23 Jul 2012 11:29:06 -0400
In-Reply-To: <20120723134427.GA3524@thinkpad-t410>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org, Arun Raghavan <arun.raghavan@collabora.co.uk>, linux-kernel@vger.kernel.org

On 07/23/2012 06:44 AM, Seth Forshee wrote:

> On Mon, Jul 23, 2012 at 02:30:10PM +0100, Matthew Garrett wrote:
>>> I'm looking at Andreas's code for switcharoo support, and something I
>>> want to do along with it is make apple-gmux not dependent on backlight
>>> support (i.e. you can still build switcharoo support if
>>> BACKLIGHT_CLASS_DEVICE is disabled). I'm assuming this patch as a
>>> prerequisite. But things do get really monstrously ugly, so if there's a
>>> cleaner way to enforce this that I haven't found I'd love to hear about
>>> it.
>>
>> Why do you want to support that case? One of the problems we have with 
>> the kernel at present is that it's trivial to come up with non-sensical 
>> configurations. I can't think of a single case where you'd want the gmux 
>> support without also having the backlight support code.
> 
> Just because there isn't strictly any reason that the switching code
> needs to depend on backlight support. But yes, I can't think of a good
> reason why anyone would want this configuration. I won't mess with it
> then.


then it should be required in Kconfig file(s), not left to
create build errors.

-- 
~Randy
