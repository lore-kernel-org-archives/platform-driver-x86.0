From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v4 1/1] Introduce Intel RAPL cooling device driver
Date: Tue, 9 Apr 2013 16:52:06 -0700
Message-ID: <20130409235206.GA6649@kroah.com>
References: <1365551209-14392-1-git-send-email-jacob.jun.pan@linux.intel.com>
 <1365551209-14392-2-git-send-email-jacob.jun.pan@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1365551209-14392-2-git-send-email-jacob.jun.pan@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacob Pan <jacob.jun.pan@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Matthew Garrett <matthew.garrett@nebula.com>, Joe Perches <joe@perches.com>, Zhang Rui <rui.zhang@intel.com>, Rafael Wysocki <rafael.j.wysocki@intel.com>, Len Brown <len.brown@intel.com>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Arjan van de Ven <arjan@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Apr 09, 2013 at 04:46:49PM -0700, Jacob Pan wrote:
> + *
> + *  You should have received a copy of the GNU General Public License
> + *  along with this program; if not, write to the Free Software
> + *  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110,
> + *  USA

I'm getting real tired of reminding Intel developers that they don't
want to be responsible for tracking the office movements of the FSF for
the next 40+ years.

Arjan, can you please get the "default" Intel GPL header that you all
use changed so I don't have to make this request for every single new
file that is submitted by Intel developers?

thanks,

greg k-h
